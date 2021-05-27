using System;
using System.Linq;
using Xunit;

namespace palindrome
{
    public class Tests
    {
        [Theory] // 4  test values provided
        [InlineData("A Santa at Nasa", true)]
        [InlineData("A man a plan a canal panama", true)]
        [InlineData("Dumb  mud", true)]
        [InlineData("Hello world", false)]
        public void Test(string input, bool expected)
        {
            Assert.Equal(expected, input.IsPalindrome());
        }

    }
}
