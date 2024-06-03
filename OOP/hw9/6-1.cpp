#include<iostream>
using namespace std; 
class Vehicle 
{ 
    protected: 
        int wheels; 
        float weight; 
    public: 
        Vehicle(int wheels,float weight); 
        int get_wheels(); 
        float get_weight(); 
        float wheel_load(); 
        void show(); 
}; 

/* 请在这里填写答案 */
Vehicle::Vehicle(int wheels, float weight)
{
    this->wheels = wheels;
    this->weight = weight;
}

int Vehicle::get_wheels()
{
    return wheels;
}

float Vehicle::get_weight()
{
    return weight;
}

float Vehicle::wheel_load()
{
    return weight / wheels;
}

void Vehicle::show()
{
    cout << "Type:Vehicle" << endl;
    cout << "Wheel:" << wheels << endl;
    cout << "Weight:" << weight << "kg" << endl;
}

class Car: public Vehicle {
    int passenger_load;
public:
    Car(int iWheels, float iWeight, int iPassenger_load): Vehicle(iWheels, iWeight), passenger_load(iPassenger_load) {}
    void show()
    {
        cout << "Type:Car" <<endl;
        Vehicle::show();
        cout << "Load:" << passenger_load << " persons" << endl;
    }
};

int main ()
{
    Vehicle v(4,1000);
    v.show();
    Car car1(4,2000,5);
    car1.show ();
    return 0;
}
