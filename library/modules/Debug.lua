---@meta Debug
---The debug module contains debug functions.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#debug)
Debug = {}

---Assert a condition during automated tests.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#debug-assert)
---@param condition boolean Condition
---@param message string Message
function Debug.Assert(condition, message) end

---Ending an automated test scenario.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#debug-endtest)
function Debug.EndTest() end

---Print the current call stack.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#debug-printcallstack)
function Debug.PrintCallStack() end

---Get lua internal memory stats.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#debug-getstats)
---@return table # Stats
function Debug.GetStats() return {} end

---Get a hash of the entire map state.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#debug-getmapstatehash)
---@return integer # All hash number
function Debug.GetMapStateHash() return 0 end

---Start or stop tracking of all LUA memory allocations.
--- Will log all new allocations that have not been freed between starting and stopping.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#debug-setmemorytracking)
---@param state boolean State
function Debug.SetMemoryTracking(state) end

---Time some code.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#debug-benchmark)
---@return integer # Number of milliseconds (returned every second call)
function Debug.Benchmark() return 0 end

---Crash the program (only works in mod development mode).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#debug-crashprogram)
function Debug.CrashProgram() end

