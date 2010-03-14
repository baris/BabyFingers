/*
 *  util.h
 *  BabyFingers
 *
 *  Created by Baris Metin
 *
 */

#import <stdlib.h>
#import <stdio.h>
#import <string.h>
#import <ctype.h>
#import <sys/stat.h>


static inline int is_newline(char c)
{
    return c == '\n';
}


static inline int is_whitespace(char c)
{
    return c == ' ' || c == '\t';
}


static inline int is_token_char(char c)
{
    return isalnum(c) || c == '.' || c == '-' || c == '_';
}


static inline int is_number(char* str)
{
    char* c = str;
    
    if (isdigit(*c) || *c == '-' || *c == '.') {
        do {
            ++c;
        } while(*c && (isdigit(*c) || *c == '.'));
        
        if (*c == '\0') {
            return 1;
        }
    }
    return 0;
}


static inline int string_startswith(char* str, char* find_str)
{
    return strncmp(str, find_str, strlen(find_str)) == 0;
}


static inline char* string_trim_left(char* str)
{
    char* c = str;
    while (c && is_whitespace(*c)) {
        ++c;
    }
    char* new_str = strdup(c);
    free(str);
    str = 0;
    return new_str;
}


static inline char* string_trim_right(char* str)
{
    size_t len = strlen(str);
    char* c = str + len;
    while (len && is_whitespace(*c)) {
        --c;
    }
    char* new_str = (char*) malloc((sizeof(char)*len)+ 1);
    strncpy(new_str, str, len);
    new_str[len] = '\0';
    free(str);
    str = 0;
    return new_str;
}


static inline char* string_trim(char* str)
{
    return string_trim_right(string_trim_left(str));
}


static inline size_t string_next_token(char* str, char* token)
{
    char *c = str;
    char *start = 0;
    
    while (is_whitespace(*c)) ++c;
    
    start = c;
    while (is_token_char(*c)) ++c;
    
    size_t token_len = c - start;
    if (token_len) {
        token = (char*) malloc(token_len + 1);
        memcpy(token, start, token_len);
        token[token_len] = '\0';
    }
    
    return token_len;
}
