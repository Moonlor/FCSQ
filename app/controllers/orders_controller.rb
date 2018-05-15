class OrdersController < ApplicationController

  def create

    @client = Alipay::Client.new(
        url: ENV['ALIPAY_API'],
        app_id: ENV['APP_ID'],
        app_private_key: ENV['APP_PRIVATE_KEY'],
        alipay_public_key: ENV['ALIPAY_PUBLIC_KEY']
    )

    @order = current_user.orders.build
    @order.user_id = current_user.id
    @order.status = 0
    @order.subject = 'test'
    @order.amount = '0.01'

    # u = @client.page_execute_url(
    #     method: 'alipay.trade.wap.pay',
    #     return_url: @user,
    #     biz_content: {
    #         out_trade_no: @order.id,
    #         product_code: 'QUICK_WAP_WAY',
    #         total_amount: '0.01',
    #         subject: 'Example: 456',
    #         quit_url: @user
    #     }.to_json(ascii_only: true)
    # )
    #

    u = @client.page_execute_url(
        method: 'alipay.trade.page.pay',
        quit_url: user_path(@current_user),
        biz_content: {
            out_trade_no: '20169501000230',
            product_code: 'FAST_INSTANT_TRADE_PAY',
            total_amount: '10000',
            subject: 'test'
        }.to_json(ascii_only: true), # to_json(ascii_only: true) is important!
        timestamp: '2016-04-01 00:00:00'
    )

    redirect_to u

  end
end
