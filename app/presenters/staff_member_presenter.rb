class StaffMemberPresenter < ModelPresenter
  delegate :suspended?, :family_name, :given_name, :family_name_kana, :given_name_kana, to: :object

  def full_name
    family_name + " " + given_name
  end

  def full_name_kana
    family_name_kana + " " + given_name_kana
  end

  # 職員の停止フラグのOn/Offを表現する 記号を返す
  # On: BALLOT BOX WITH CHECK(U+2611)
  # On: BALLOT BOX WITH (U+2610)
  def suspended_mark
    suspended? ? raw("&#x2611;") : raw("&#x2610;")
  end
end
