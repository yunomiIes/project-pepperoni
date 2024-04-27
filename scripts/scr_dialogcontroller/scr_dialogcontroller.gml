/*
DECOMPILER FAILED!

System.InvalidOperationException: Collection was modified; enumeration operation may not execute.
   at System.Collections.Generic.Dictionary`2.Enumerator.MoveNext()
   at System.Linq.Enumerable.TryGetFirst[TSource](IEnumerable`1 source, Func`2 predicate, Boolean& found)
   at System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source, Func`2 predicate)
   at UndertaleModLib.Decompiler.Decompiler.FunctionDefinition.ToString(DecompileContext context) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Instructions\Decompiler.FunctionDefinition.cs:line 100
   at UndertaleModLib.Decompiler.Decompiler.AssignmentStatement.ToString(DecompileContext context) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Instructions\Decompiler.AssignmentStatement.cs:line 80
   at UndertaleModLib.Decompiler.Decompiler.Decompile(UndertaleCode code, GlobalDecompileContext globalContext, Action`1 msgDelegate) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 1584
   at Submission#0.DumpCode(UndertaleCode code, String scriptName, Boolean wrapFunc) in C:\Users\Beto\Desktop\October 2022 Build\Decompiler\CodeDecompiler.csx:line 143
*/