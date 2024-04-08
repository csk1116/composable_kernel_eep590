// SPDX-License-Identifier: MIT
// Copyright (c) 2018-2023, Advanced Micro Devices, Inc. All rights reserved.

#pragma once

#include <cmath>
#include <numeric>
#include <random>

#include "ck/ck.hpp"

template <typename T>
struct GeneratorTensor_0
{
    template <typename... Is>
    T operator()(Is...)
    {
        return T{0};
    }
};

template <typename T>
struct GeneratorTensor_1
{
    T value = 1;

    template <typename... Is>
    T operator()(Is...)
    {
        return value;
    }
};

template <>
struct GeneratorTensor_1<ck::bhalf_t>
{
    float value = 1.0;

    template <typename... Is>
    ck::bhalf_t operator()(Is...)
    {
        return ck::type_convert<ck::bhalf_t>(value);
    }
};

template <>
struct GeneratorTensor_1<int8_t>
{
    int8_t value = 1;

    template <typename... Is>
    int8_t operator()(Is...)
    {
        return value;
    }
};

template <typename T>
struct GeneratorTensor_2
{
    int min_value = 0;
    int max_value = 1;

    template <typename... Is>
    T operator()(Is...)
    {
        return static_cast<T>((std::rand() % (max_value - min_value)) + min_value);
    }
};

template <>
struct GeneratorTensor_2<ck::bhalf_t>
{
    int min_value = 0;
    int max_value = 1;

    template <typename... Is>
    ck::bhalf_t operator()(Is...)
    {
        float tmp = (std::rand() % (max_value - min_value)) + min_value;
        return ck::type_convert<ck::bhalf_t>(tmp);
    }
};

template <>
struct GeneratorTensor_2<int8_t>
{
    int min_value = 0;
    int max_value = 1;

    template <typename... Is>
    int8_t operator()(Is...)
    {
        return (std::rand() % (max_value - min_value)) + min_value;
    }
};

#if defined CK_ENABLE_FP8
template <>
struct GeneratorTensor_2<ck::f8_t>
{
    int min_value = 0;
    int max_value = 1;

    template <typename... Is>
    ck::f8_t operator()(Is...)
    {
        float tmp = (std::rand() % (max_value - min_value)) + min_value;
        return ck::type_convert<ck::f8_t>(tmp);
    }
};
#endif

#if defined CK_ENABLE_BF8
template <>
struct GeneratorTensor_2<ck::bf8_t>
{
    int min_value = 0;
    int max_value = 1;

    template <typename... Is>
    ck::bf8_t operator()(Is...)
    {
        float tmp = (std::rand() % (max_value - min_value)) + min_value;
        return ck::type_convert<ck::bf8_t>(tmp);
    }
};
#endif

template <typename T>
struct GeneratorTensor_3
{
    float min_value = 0;
    float max_value = 1;

    template <typename... Is>
    T operator()(Is...)
    {
        float tmp = float(std::rand()) / float(RAND_MAX);

        return static_cast<T>(min_value + tmp * (max_value - min_value));
    }
};

// template <typename T>
// struct GeneratorTensor_3_control_entropy
// {

//     // constexpr static int fp32_exponent_size = 8;
//     // constexpr static int fp32_mantissa_size = 23;
//     constexpr static int fp16_exponent_size = 5;
//     constexpr static int fp16_mantissa_size = 10;

//     mutable std::mt19937 gen{std::random_device{}()};
//     mutable std::uniform_int_distribution<uint16_t> dis{0, 0xFFFF};
//     float MAX_FP32_NUM = 0xFFFFFFFF;
//     float MAX_FP16_NUM = 0xFFFF;

//     template <typename... Is>
//     T operator()(Is...) const
//     {
//         uint16_t bits = dis(gen); // Generate 32 random bits

//         // Combine the bits into a floating-point number according to IEEE 754 format
//         uint16_t sign     = bits >> 15;           // Get the sign bit
//         uint16_t exponent = (bits >> 10) & 0x1F; // Get the exponent bits
//         uint16_t mantissa = bits & 0x3FF;      // Get the mantissa bits

//         if(exponent == 0x1F || exponent == 0)
//         {
//             // Avoid NaN and denormalized numbers
//             return static_cast<T>(0.0);
//         }

//         // Shift the exponent to the correct position and set the sign bit

//         int16_t result = (sign << 15) | ((exponent - 15 + 0x1F) << 10) |
//                           (mantissa >> (10 - fp16_mantissa_size));
//         float v= static_cast<float>(*reinterpret_cast<uint16_t*>(std::bitset<16>(result).to_string().c_str())) / MAX_FP16_NUM;
//         printf("%0f,\t", v / MAX_FP16_NUM);
//         return static_cast<T>(vector_type_maker / MAX_FP16_NUM);
//     }
// };
template <>
struct GeneratorTensor_3<ck::bhalf_t>
{
    float min_value = 0;
    float max_value = 1;

    template <typename... Is>
    ck::bhalf_t operator()(Is...)
    {
        float tmp = float(std::rand()) / float(RAND_MAX);

        float fp32_tmp = min_value + tmp * (max_value - min_value);

        return ck::type_convert<ck::bhalf_t>(fp32_tmp);
    }
};

#if defined CK_ENABLE_FP8
template <>
struct GeneratorTensor_3<ck::f8_t>
{
    float min_value = 0;
    float max_value = 1;

    template <typename... Is>
    ck::f8_t operator()(Is...)
    {
        float tmp = float(std::rand()) / float(RAND_MAX);

        float fp32_tmp = min_value + tmp * (max_value - min_value);

        return ck::type_convert<ck::f8_t>(fp32_tmp);
    }
};
#endif

#if defined CK_ENABLE_BF8
template <>
struct GeneratorTensor_3<ck::bf8_t>
{
    float min_value = 0;
    float max_value = 1;

    template <typename... Is>
    ck::bf8_t operator()(Is...)
    {
        float tmp = float(std::rand()) / float(RAND_MAX);

        float fp32_tmp = min_value + tmp * (max_value - min_value);

        return ck::type_convert<ck::bf8_t>(fp32_tmp);
    }
};
#endif

template <typename T>
struct GeneratorTensor_4
{
    std::mt19937 generator;
    std::normal_distribution<float> distribution;

    GeneratorTensor_4(float mean, float stddev, unsigned int seed = 1)
        : generator(seed), distribution(mean, stddev){};

    template <typename... Is>
    T operator()(Is...)
    {
        float tmp = distribution(generator);

        return ck::type_convert<T>(tmp);
    }
};

struct GeneratorTensor_Checkboard
{
    template <typename... Ts>
    float operator()(Ts... Xs) const
    {
        std::array<ck::index_t, sizeof...(Ts)> dims = {static_cast<ck::index_t>(Xs)...};
        return std::accumulate(dims.begin(),
                               dims.end(),
                               true,
                               [](bool init, ck::index_t x) -> int { return init != (x % 2); })
                   ? 1
                   : -1;
    }
};

template <ck::index_t Dim>
struct GeneratorTensor_Sequential
{
    template <typename... Ts>
    float operator()(Ts... Xs) const
    {
        std::array<ck::index_t, sizeof...(Ts)> dims = {{static_cast<ck::index_t>(Xs)...}};
        return dims[Dim];
    }
};

template <typename T, size_t NumEffectiveDim = 2>
struct GeneratorTensor_Diagonal
{
    T value{1};

    template <typename... Ts>
    T operator()(Ts... Xs) const
    {
        std::array<ck::index_t, sizeof...(Ts)> dims = {{static_cast<ck::index_t>(Xs)...}};
        size_t start_dim                            = dims.size() - NumEffectiveDim;
        bool pred                                   = true;
        for(size_t i = start_dim + 1; i < dims.size(); i++)
        {
            pred &= (dims[start_dim] == dims[i]);
        }
        return pred ? value : T{0};
    }
};
