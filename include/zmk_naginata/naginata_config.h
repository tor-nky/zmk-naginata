#pragma once

#define NG_WINDOWS 0
#define NG_MACOS 1
#define NG_LINUX 2
#define NG_IOS 3

typedef struct {
    uint8_t os : 2;      // 2 bits can store values 0-3 (NG_WINDOWS, NG_MACOS, NG_LINUX, NG_IOS)
    bool tategaki : 1;   // true: 縦書き, false: 横書き
} user_config_t;
