class AddLlmRawOutputToScans < ActiveRecord::Migration[7.1]
  def change
    add_column :scans, :llm_raw_output, :jsonb
  end
end
