#ifndef LOGGING_MACROS_H
#define LOGGING_MACROS_H

#include <cstdio>
#include <cstdarg>

// Function declarations
inline void logError(const char* format, ...) {
    va_list args;
    va_start(args, format);
    fprintf(stderr, "Error: ");
    vfprintf(stderr, format, args);
    fprintf(stderr, "\n");
    va_end(args);
}

inline void logInfo(const char* format, ...) {
    va_list args;
    va_start(args, format);
    fprintf(stdout, "Info: ");
    vfprintf(stdout, format, args);
    fprintf(stdout, "\n");
    va_end(args);
}

#endif // LOGGING_MACROS_H 