# frozen_string_literal: true

class Email < ApplicationRecord
  enum direction: { in: "in", out: "out" }
end
