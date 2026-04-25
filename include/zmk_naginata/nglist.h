#pragma once
#include <zephyr/device.h>

#define LIST_SIZE 5 // 集合の最大サイズ

typedef struct {
    uint32_t elements[LIST_SIZE];
    int size;
} NGList;

void initializeList(NGList *);
bool addToList(NGList *, uint32_t);
int includeList(NGList *, uint32_t);
bool removeFromList(NGList *, uint32_t);
bool removeFromListAt(NGList *, int);
void copyList(NGList *, NGList *);

bool compareList0(NGList *, uint32_t);
bool compareList01(NGList *, uint32_t, uint32_t);
