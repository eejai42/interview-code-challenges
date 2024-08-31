using System;
using System.Collections.Generic;                        
using System.Linq;
using Xunit;


namespace squareroot
{
    static class Implementation
    {
        /// <summary>
        /// Return the square root of a number
        /// </summary>
        /// <param name="inputValue">The input value(s) to operate on</param>
        /// <returns>The result of the function</returns>
        
        public static double SquareRoot(this double inputValue)
        {
            // TODO: Implement
            return Math.Sqrt(inputValue);
        }
    }
}

