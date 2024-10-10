#include "registx.h"

HANDLEEX g_handles;

void RegistInitHandle(InitHandle f)
{
    g_handles.init_Handle = f;
}

void RegistExitHandle(InitHandle f)
{
    g_handles.exit_Handle = f;
}

void RegistAHandle(AHandle f)
{
    g_handles.a_Handle = f;
}

void RegistBHandle(BHandle f)
{
    g_handles.b_Handle = f;
}

void RegistDefaultHandle(DefaultHandle f)
{
    g_handles.default_Handle = f;
}
