class Circle
{
private:
    double rad;
    double area;
    friend istream& operator>>(istream&in, Circle &cl);       //重载>>为Circle类的友元函数
    friend ostream& operator<<(ostream&out, Circle &cl);        //重载<<为Circle类的友元函数
public:
    Circle(double r=0)
    {
        rad=r;
        area=3.14*r*r;
    }
    double operator- (Circle &cl)//重载减号
    {
        return this->area-cl.area;//返回两个圆的面积差
    }
};
istream& operator>>(istream&in, Circle &cl)
{
    in >> cl.rad;   //从输入流中提取数据给圆的半径
    cl.area=3.14*cl.rad*cl.rad;
    return in;
}
ostream& operator<<(ostream&out, Circle &cl)
{
    out<< "rad=" << cl.rad << "area=" << cl.area;    //输出圆的半径和面积，形如：rad=10 area=314
    return out;
}

int main()
{
    Circle c1,c2;
    cin>>c1>>c2;
    cout<<c1<<endl;
    cout<<c2<<endl;
    cout<<c2-c1<<endl;
    return 0;
}
