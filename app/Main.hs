module Main where

import           Data.List
import           Data.Validation
import           Prelude         hiding (error)

type FromAddress = Address

type ToAddress = Address

newtype Address =
  Address String
  deriving (Show)

newtype Body =
  Body String
  deriving (Show)

data Error
  = MustNotBeEmpty
  | MustContain String
  deriving (Show)

data FieldError = FieldError
  { error     :: Error
  , fieldName :: String
  } deriving (Show)

data Email = Email
  { from :: FromAddress
  , to   :: ToAddress
  , body :: Body
  } deriving (Show)

main :: IO ()
main = do
  print $ validateEmail "from" "to" ""
  print $ validateEmail "from" "to@mail" "This is a test"
  print $ validateEmail "from@mail" "to" "This is a test"
  print $ validateEmail "from@mail" "to@mail" "This is a test"
  print $ validateEmail "from" "to" "This is a test"

validateAddress :: String -> String -> Validation [FieldError] Address
validateAddress address which
  | "@" `isInfixOf` address = Address <$> Success address
  | otherwise = Failure [FieldError {error = MustContain "@", fieldName = which}]

validateBody :: String -> Validation [FieldError] Body
validateBody [] = Failure [FieldError {error = MustNotBeEmpty, fieldName = "body"}]
validateBody body' = Body <$> Success body'

validateEmail :: String -> String -> String -> Validation [FieldError] Email
validateEmail from' to' body' =
  Email <$> validateAddress from' "from-address" <*> validateAddress to' "to-address" <*> validateBody body'
