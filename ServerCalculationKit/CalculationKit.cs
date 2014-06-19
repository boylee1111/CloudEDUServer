using System;
using System.Collections.Generic;
using System.Linq;

namespace ServerCalculationKit
{
    public class CalculationKit
    {
        public static CalculationKit instance;

        private CalculationKit() { }
        public static CalculationKit Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new CalculationKit();
                }
                return instance;
            }
        }

        public int[] ImproveAllPermission(int[] permissionNums)
        {
            bool predicate = permissionNums.All(p => p != 0);
            if (predicate)
            {
                for (int i = 0; i < permissionNums.Length; ++i)
                {
                    permissionNums[i] -= 1 << i;
                }
            }
            return permissionNums;
        }
    }

    public static class LinqExtension
    {
        public static void ForEach<T>(this IEnumerable<T> source, Action<T> action)
        {
            foreach (T element in source)
            {
                action(element);
            }
        }

        public static T ThrowIfNull<T>(this T value, string variableName) where T : class
        {
            if (value == null)
            {
                throw new NullReferenceException(string.Format("Value is Null: {0}", variableName));
            }

            return value;
        }

        public static TSource[] Acquire<TSource>(this IEnumerable<TSource> source)
            where TSource : IDisposable
        {
            if (source == null) throw new ArgumentNullException("source");

            var disposables = new List<TSource>();
            try
            {
                disposables.AddRange(source);
                return disposables.ToArray();
            }
            catch
            {
                foreach (var disposable in disposables)
                    disposable.Dispose();
                throw;
            }
        }
    }
}
