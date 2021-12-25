module AOC (Solution (Solution), exec) where

-- data Day where
--   Day ::
--     (Show a, Show b) =>
--     Int -> -- Day number
--     (String -> input) -> -- Input parser
--     (input -> a) -> -- Solution to part A
--     (input -> b) -> -- Solution to part B
--     Day

data Solution parsed part1 part2 = Solution Int ([String] -> parsed) (parsed -> part1) (parsed -> part2)

reader :: FilePath -> IO [String]
reader = fmap lines . readFile

exec :: (Show b, Show c) => String -> Solution a b c -> IO ()
exec file (Solution n parser part1 part2) = do
  putStrLn $ "Day " ++ show n
  contents <- reader file
  let parsed = parser contents
  print $ part1 parsed
  print $ part2 parsed