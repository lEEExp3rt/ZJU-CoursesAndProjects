#include <iostream>

using namespace std;

#define MAXN 100
class Matrix {
    int flag = 0;
    int row;
    int column;
    int data[MAXN][MAXN];
public:
    Matrix(int r, int c): row(r), column(c) {
        for (int i = 0; i < row; i++)
            for (int j = 0; j < column; j++)
                data[i][j] = 0;
    };
    void input(void);
    void show(void);
    void transform(void);
};

void Matrix::input(void)
{
    for (int i = 0; i < row; i++)
        for (int j = 0; j < column; j++)
            cin >> data[i][j];
}

void Matrix::show(void)
{
    if (!flag) {
        for (int r = 0; r < row; r++) {
            for (int c = 0; c < column; c++)
                cout << " " << data[r][c];
            cout << endl;
        }
    }
    else {
        for (int r = 0; r < column; r++) {
            for (int c = 0; c < row; c++)
                cout << " " << data[c][r];
            cout << endl;
        }
    }
}

void Matrix::transform(void)
{
    flag = 1 - flag;
}

/* 请在这里填写答案 */
int main(){
    int r,c;
    cin>>r>>c; 
    Matrix m(r,c); // 初始大小 2行3列 
    m.input();
    cout<<"datas before:"<<endl;
    m.show();
    m.transform();
    cout<<"datas after:"<<endl;
    m.show();
}
