#ifndef SLANG_CORE_TIMERS
#define SLANG_CORE_TIMERS

#include <chrono>

struct ScopedTimer
{
    using clk_t = std::chrono::high_resolution_clock;
    using time_t = clk_t::time_point;
    using micro  = std::chrono::microseconds;

    std::string section;

    clk_t clk;
    time_t start;
    time_t end;

    ScopedTimer(const std::string &s)
        : section(s)
    {
        start = clk.now();
    }

    double time() {
        end = clk.now();
        auto delta_ms = std::chrono::duration_cast <micro> (end - start).count();
        return double(delta_ms) / 1e6;
    }
};

struct PlainScopedTimer : ScopedTimer
{
    PlainScopedTimer(const std::string &s) : ScopedTimer(s) {}

    ~PlainScopedTimer()
    {
        double t = time();
        printf("%50s # %.6fs\n", section.c_str(), t);
    }
};

struct TreeScopedTimer : ScopedTimer
{
    static int& nest()
    {
        static int p = 0;
        return p;
    }
    
    int n;

    TreeScopedTimer(const std::string& s)
        : ScopedTimer(s), n(nest()++) {}

    ~TreeScopedTimer()
    {
        double t = time();
        std::string spacing(4 * n, ' ');
        printf("%s(%.6fs) %s\n", spacing.c_str(), t, section.c_str());
        nest() = n;
    }
};

using ActiveTimer = PlainScopedTimer;
#define __scoped_timer() ActiveTimer _timer(__FUNCTION__);
#define __scoped_timer_section(s) ActiveTimer _timer(#s);

#endif
