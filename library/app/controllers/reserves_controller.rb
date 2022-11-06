class ReservesController < ApplicationController
  before_action :login_seigen
  before_action :only_owner, only: [:list, :lending]

  def create
    @reserve = Reserve.new(user_id: @current_user.id, book_id: params[:book_id])
    @book = @reserve.book
    if @book.hold > 0 then
      @book.hold -= 1
      @book.save
      @reserve.save
      flash[:notice] = "予約が完了しました"
      redirect_to("/books/#{params[:book_id]}")
    else
      flash[:notice] = "在庫がありません"
      redirect_to("/books/#{params[:book_id]}")
    end
  end

  def destroy
    @reserve = Reserve.find_by(user_id: @current_user.id, book_id: params[:book_id])
    @book = @reserve.book
    @book.hold += 1
    @book.save
    @reserve.destroy
    flash[:notice] = "予約を取り消しました"
    redirect_to("/books/#{params[:book_id]}")
  end

  def list
    @reserves = Reserve.where(flag: nil)
    @circulations = Reserve.where(flag: 1)
  end

  def lending
    @reserve = Reserve.find_by(user_id: params[:user_id], book_id: params[:book_id])
    @reserve.flag = 1
    @reserve.save
    redirect_to("/reserves/NID00054A/list")
  end

  def cancel
    @reserve = Reserve.find_by(user_id: params[:user_id], book_id: params[:book_id])
    @book = @reserve.book
    @reserve.flag = nil
    @book.hold += 1
    @book.save
    @reserve.save
    @reserve.destroy
    flash[:notice] = "本の返却が完了しました"
    redirect_to("/reserves/NID00054A/list")
  end

  private
  def only_owner
    if @current_user.id != 1
      flash[:notice] = "権限がありません"
      redirect_to("/books/list")
    end
  end
end
