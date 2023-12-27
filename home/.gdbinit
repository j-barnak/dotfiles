set confirm off
set verbose off
set print thread-events off
set history save on
set tui tab-width 4
set disassembly-flavor intel

alias ffp=set follow-fork-mode parent
alias ffc=set follow-fork-mode child

export ASAN_OPTIONS=abort_on_error=1:halt_on_error=1:allocator_may_return_null=1:print_legend=0:detect_leaks=0
export UBSAN_OPTIONS=abort_on_error=1:halt_on_error=1
export TSAN_OPTIONS=abort_on_error=1:halt_on_error=1

## Skip over the implementation's stack frames on abort/etc.
if !$_isvoid($_any_caller_matches)
    define hook-stop
        while $_thread && $_any_caller_matches("^__|abort|raise")
            up-silently
        end
    end
end

add-auto-load-safe-path /
