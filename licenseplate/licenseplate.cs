using System;
using System.Collections.Generic;                        
using System.Linq;
using Xunit;


namespace licenseplate
{
    static class Implementation
    {
        /// <summary>
        /// In a list of license plate numbers, detect whether the list contains any duplicates or not. In this case in Swedish format, with three letters followed by three digits, like `ABC123`. The function should return true if the list contains duplicates and false if not. > If interviewing senior developers, the problem can be tweaked to find an effective solution, which only looks at every license plate number at most once.
        /// </summary>
        /// <param name="inputValue">The input value(s) to operate on</param>
        /// <returns>The result of the function</returns>
        
        public static bool HasDuplicates(this List<string> inputValue)
        {
            // TODO: Implement
            return inputValue.Count != inputValue.Distinct().Count();
        }
    }
}

