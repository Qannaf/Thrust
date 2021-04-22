/*
#include "cuda_runtime.h"
#include "device_launch_parameters.h"



#include <stdio.h>
#include <thrust/host_vector.h>
#include <thrust/device_vector.h>
#include <iostream>


//vector

int main(void)
{
    // H has storage for 4 integers
    thrust::host_vector<int> H(4);

    // initialize individual elements
    H[0] = 14;
    H[1] = 20;
    H[2] = 38;
    H[3] = 46;

    // H.size() returns the size of vector H
    std::cout << "H has size " << H.size() << "\n";

    // print contents of H
    for (int i = 0; i < H.size(); i++)
        std::cout << "H[" << i << "] = " << H[i] << "\n";

    // resize H
    H.resize(2);

    std::cout << "H now has size " << H.size() << "\n";

    // Copy host_vector H to device_vector D
    thrust::device_vector<int> D = H;

    // elements of D can be modified
    D[0] = 99;
    D[1] = 88;

    // print contents of D
    for (int i = 0; i < D.size(); i++)
        std::cout << "D[" << i << "] = " << D[i] << "\n";

    // H and D are automatically deleted when the function returns
    return 0;
}
//*/

#include <thrust/host_vector.h>
#include <thrust/device_vector.h>

#include <thrust/copy.h>
#include <thrust/fill.h>
#include <thrust/sequence.h>

#include <iostream>


int main(void)
{
    int i(0);
    thrust::device_vector<int> D(10, 1);            // initialize all ten integers of a device_vector to 1
    thrust::fill(D.begin() + 3, D.begin() + 6, 0);  // set the first seven elements of a vector to 9

    thrust::host_vector<int> H(D.size());
    thrust::copy(D.begin(), D.end(), H.begin());    // copy all of H back to the beginning of D
    thrust::sequence(H.begin(), H.end());           // set the elements of H to 0, 1, 2, 3, ...


    // print D
    for (thrust::device_vector <int>::const_iterator it = D.begin(); it != D.end(); ++it)
    {
        std::cout << "D[" << i << "] = " << *it << "\t";
        i++;
    }
    for (int i = 0; i < H.size(); i++)
        std::cout << "H[" << i << "] = " << H[i] << "\t";

    return 0;
}
   
 