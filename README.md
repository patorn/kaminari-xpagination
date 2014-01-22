# Kaminari::Xpagination

It provides x-pagination headers for paginated resources which come from a response.

Header examples,

  * Total
  * Total Pages
  * First
  * Last
  * Next
  * Previous

## Installation

Add this line to your application's Gemfile:

    gem 'kaminari-xpagination'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kaminari-xpagination

## Usage

    # Paginate for @orders
    after_filter only: [:index] { set_x_pagination_headers :orders }

    def index
      @orders = Order.page(params[:page]).per(params[:per_page] || 10)

      render 'index.json'
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
