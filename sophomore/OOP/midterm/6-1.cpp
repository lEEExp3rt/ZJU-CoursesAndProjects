#include <iostream>
#include <iostream>
#include <iomanip>

#define MAXN 110

/* Your answer will be inserted here. Feel free to add anything needed here.*/
class vec {
    int value;
    int order;
public:
    vec(int v, int o): value(v), order(o) {}
    inline int getOrder(void) const
    {
        return order;
    }
    bool operator<(const vec obj)
    {
        return order < obj.getOrder();
    }
};

void printArrayInfo(vec **arr, int n)
{
    vec *maxv = arr[0], *minv = arr[0];
    double avg = 0;
    for(int i = 0; i < n; ++i) {
        vec *val = arr[i];
        if(*val < *minv) minv = val;
        if(*maxv < *val) maxv = val;
        avg = avg + static_cast<double>(*val);
    }
    avg /= n;
    std::cout << std::fixed << std::setprecision(2) <<  "min = " << *minv << ", max = " << *maxv << ", avg = " << avg << std::endl;
}

int main()
{
    vec *pool[MAXN];
    int n;
    int a, b;
    std::cin >> n;
    for (int i = 0; i < n; i++) {
        std::cin >> a >> b;
        pool[i] = new vec(a, b);
    }
    printArrayInfo(pool, n);
    return 0;
}
