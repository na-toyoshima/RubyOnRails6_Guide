require "rails_helper"

describe Admin::Authenticator do
  describe "#authenticate" do
    example "正しいパスワードならtrueを返す" do
      m = build(:administrator)
      expect(Admin::Authenticator.new(m).authenticate("pw")).to be_truthy
    end

    example "謝ったパスワードならfalseを返す" do
      m = build(:administrator)
      expect(Admin::Authenticator.new(m).authenticate("xy")).to be_falsey
    end

    example "パスワード未設定ならfalseを返す" do
      m = build(:administrator, password: nil)
      expect(Admin::Authenticator.new(m).authenticate(nil)).to be_falsey
    end

    example "停止フラグが立っていてもtrueを返す" do
      m = build(:staff_member, suspended: true)
      expect(Admin::Authenticator.new(m).authenticate("pw")).to be_truthy
    end
  end
end
