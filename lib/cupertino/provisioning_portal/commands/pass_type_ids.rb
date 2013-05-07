
command :'pass_type_ids:list' do |c|
  c.syntax = 'ios pass_type_ids:list'
  c.summary = 'Lists the Pass Type IDs'
  c.description = ''

  c.action do |args, options|
    pass_type_ids = try{agent.list_pass_type_ids}

    table = Terminal::Table.new do |t|
      t << ["Card ID", "Identifier", "Description", "Status"]
      pass_type_ids.each do |pass_type_id|
        t << :separator

        t << [pass_type_id.card_id, pass_type_id.id, pass_type_id.description, pass_type_id.status]
      end
    end

    puts table
  end
end

alias_command :pass_type_ids, :'pass_type_ids:list'
