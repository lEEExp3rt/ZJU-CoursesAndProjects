#include <stdio.h>
#include <stdbool.h>

#define MAX_ROWS 100
#define MAX_COLS 100

int matrix[MAX_ROWS][MAX_COLS];
int state[MAX_ROWS][MAX_COLS];  // 0: 未访问，1: 正在访问，2: 已访问

int start_row, start_col, end_row, end_col, rows, cols;

int cycleCount = 0;

bool dfs(int row, int col) {
    // 如果当前位置是出口
    if (row == end_row && col == end_col) {
        return true;
    }

    // 标记当前位置为正在访问
    state[row][col] = 1;

    // 检查上、下、左、右四个方向
    int dr[] = {-1, 1, 0, 0};
    int dc[] = {0, 0, -1, 1};

    for (int i = 0; i < 4; ++i) {
        int new_row = row + dr[i];
        int new_col = col + dc[i];

        // 检查新位置是否在矩阵范围内，且是通行的路
        if (new_row >= 0 && new_row < rows && new_col >= 0 && new_col < cols
            && matrix[new_row][new_col] == 1) {
            // 根据新位置的状态进行判断
            if (state[new_row][new_col] == 0) {
                // 未访问状态，继续DFS递归
                if (dfs(new_row, new_col)) {
                    return true;
                }
            } else if (state[new_row][new_col] == 1) {
                // 正在访问状态，存在环
                cycleCount++;
            }
            // 已访问状态，不需要处理
        }
    }

    // 标记当前位置为已访问
    state[row][col] = 2;

    return false;
}

int main() {
    // 输入矩阵和起点、终点等信息

    // 初始化state数组
    for (int i = 0; i < rows; ++i) {
        for (int j = 0; j < cols; ++j) {
            state[i][j] = 0;
        }
    }

    // 调用DFS函数从入口开始搜索
    if (dfs(start_row, start_col)) {
        printf("找到一条路径\n");
    } else {
        printf("环的数量：%d\n", cycleCount);
    }

    return 0;
}
