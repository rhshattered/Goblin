#pragma once
#include "gbpch.h"
namespace Goblin {
    class GOBLIN_API ComponentLogger {
    public:
#ifdef GB_PLATFORM_WINDOWS
        float static GetTotalSystemMemory()
        {
            MEMORYSTATUSEX statex;
            statex.dwLength = sizeof(statex);
            GlobalMemoryStatusEx(&statex);
            return ceil((float)statex.ullTotalPhys / (1024 * 1024 * 1024));
        }

        std::string static GetCpuDetails()
        {

            // Get extended ids.
            int CPUInfo[4] = { -1 };
            __cpuid(CPUInfo, 0x80000000);
            unsigned int nExIds = CPUInfo[0];

            // Get the information associated with each extended ID.
            char CPUBrandString[0x40] = { 0 };
            for (unsigned int i = 0x80000000; i <= nExIds; ++i)
            {
                __cpuid(CPUInfo, i);

                // Interpret CPU brand string and cache information.
                if (i == 0x80000002)
                {
                    memcpy(CPUBrandString,
                        CPUInfo,
                        sizeof(CPUInfo));
                }
                else if (i == 0x80000003)
                {
                    memcpy(CPUBrandString + 16,
                        CPUInfo,
                        sizeof(CPUInfo));
                }
                else if (i == 0x80000004)
                {
                    memcpy(CPUBrandString + 32, CPUInfo, sizeof(CPUInfo));
                }
            }

            return CPUBrandString;
        }

#endif
#ifdef GB_PLATFORM_UNIX
        float static GetTotalSystemMemory()
        {
            long pages = sysconf(_SC_PHYS_PAGES);
            long page_size = sysconf(_SC_PAGE_SIZE);
            return ceil((float(pages * page_size)) / (1024 * 1024 * 1024));
        }
#endif
    };
}
