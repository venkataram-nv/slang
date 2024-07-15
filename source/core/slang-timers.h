#ifndef SLANG_CORE_TIMERS
#define SLANG_CORE_TIMERS

struct ScopedTimer {
    using clk_t = std::chrono::high_resolution_clock;
    using time_t = clk_t::time_point;
    using millis = std::chrono::milliseconds;

    std::string section;

    clk_t clk;
    time_t start;
    time_t end;

    ScopedTimer(const std::string &s) : section(s) {
        start = clk.now();
    }

    ~ScopedTimer() {
        end = clk.now();
    
        auto delta_ms = std::chrono::duration_cast <millis> (end - start).count();
        auto delta_s = float(delta_ms) / 1000.0;

        printf("%50s: %.3fs\n", section.c_str(), delta_s);
    }
};

#define __scoped_timer() ScopedTimer _timer(__FUNCTION__);
#define __scoped_timer_section(s) ScopedTimer _timer(#s);

#endif