# For use in integration tests. Provides a mock OmniAuth hash
module OmniauthMacros
  def mock_auth_hash(email = true)
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(data(email))
  end

  def data(email = true)
    {
      provider: 'facebook',
      uid: '123545',
      info: {
        name: 'mockuser',
        first_name: 'Han',
        last_name: 'Solo',
        email: ('c3po@therepublic.com' if email),
        image: 'mock_user_thumbnail_url',
      },
      credentials: {
        token: 'mock_token',
        secret: 'mock_secret',
      },
      extra: {
        raw_info: {
          id: '1234567',
          name: 'Han Solo',
          first_name: 'Han',
          last_name: 'Solo',
          link: 'http://www.facebook.com/jbloggs',
          username: 'jbloggs',
          location: { id: '123456789', name: 'Palo Alto, California' },
          gender: 'male',
          email: 'joe@bloggs.com',
          timezone: -8,
          locale: 'en_US',
          verified: true,
          updated_time: '2011-11-11T06:21:03+0000',
        },
      },
    }.reject { |_, v| v.nil? }
  end

  def submit
    find('input[type=submit]').click
  end
end
