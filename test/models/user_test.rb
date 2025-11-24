require "test_helper"

class UserTest < ActiveSupport::TestCase
  # Não dependemos de fixtures aqui. Criamos os registros no teste para evitar
  # qualquer problema com fixtures mal formatados.
  # Caso seu test_helper carregue fixtures :all por padrão, o importante é corrigir os arquivos em test/fixtures (veja abaixo).

  test "is valid with valid attributes" do
    user = User.new(
      name: "Ramis",
      email: "ramis@example.com",
      password: "123456",
      password_confirmation: "123456"
    )

    assert user.valid?
  end

  test "is invalid without email" do
    user = User.new(
      name: "Ramis",
      email: nil,
      password: "123456",
      password_confirmation: "123456"
    )

    assert_not user.valid?
    assert_includes user.errors[:email], "can't be blank"
  end

  test "is invalid with duplicate email" do
    User.create!(
      name: "User1",
      email: "duplicated@example.com",
      password: "123456",
      password_confirmation: "123456"
    )

    user = User.new(
      name: "User2",
      email: "duplicated@example.com",
      password: "abcdef",
      password_confirmation: "abcdef"
    )

    assert_not user.valid?
    assert_includes user.errors[:email], "has already been taken"
  end

  test "has_secure_password works" do
    user = User.create!(
      name: "Secure User",
      email: "secure@example.com",
      password: "password123",
      password_confirmation: "password123"
    )

    assert user.authenticate("password123")
    assert_not user.authenticate("wrongpassword")
  end

  test "current_passport_statuses returns the most recent status" do
    user = User.create!(
      name: "User",
      email: "user@example.com",
      password: "123456",
      password_confirmation: "123456"
    )

    older = user.passport_statuses.create!(
      name: "Submitted",
      current: false,
      created_at: 2.days.ago
    )

    newer = user.passport_statuses.create!(
      name: "Approved",
      current: true,
      created_at: 1.day.ago
    )

    assert_equal newer, user.current_passport_statuses
  end

  test "current_passport_statuses returns nil when user has no statuses" do
    user = User.create!(
      name: "Empty",
      email: "empty@example.com",
      password: "123456",
      password_confirmation: "123456"
    )

    assert_nil user.current_passport_statuses
  end
end
