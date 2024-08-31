using System;
using System.Collections.Generic;                        
using System.Linq;
using Xunit;


namespace square
{
    static class Implementation
    {
        /// <summary>
        /// Square a number
        /// </summary>
        /// <param name="inputValue">The input value(s) to operate on</param>
        /// <returns>The result of the function</returns>
        
        public static double Square(this double inputValue)
        {
            // TODO: Implement
            return inputValue * inputValue;
        }
    }
}

