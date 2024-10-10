#ifndef _REGIST_H_
#define _REGIST_H_

typedef int (*InitHandle)(void);
typedef int (*ExitHandle)(void);
typedef int (*AHandle)(void);
typedef int (*BHandle)(void);
typedef int (*DefaultHandle)(void);

typedef struct HandleEx
{
    InitHandle init_Handle;
    ExitHandle exit_Handle;
    AHandle a_Handle;
    BHandle b_Handle;
    DefaultHandle default_Handle;
}HANDLEEX;

void RegistInitHandle(InitHandle f);
void RegistExitHandle(ExitHandle f);
void RegistAHandle(AHandle f);
void RegistBHandle(BHandle f);
void RegistDefaultHandle(DefaultHandle f);

#endif /* _REGIST_H_ */
