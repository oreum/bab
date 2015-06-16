class Post < ActiveRecord::Base

  belongs_to  :user
  has_many  :comments
  validates :category, :inclusion => { :in => ["상품문의","주문/결제","배송관련","취소/환불"], :message => "한식, 일식, 중식, 양식 중 하나를 선택하셔야 합니다." }
  validates :title, :presence => { :message => "제목을 반드시 입력하셔야 합니다." }

end
