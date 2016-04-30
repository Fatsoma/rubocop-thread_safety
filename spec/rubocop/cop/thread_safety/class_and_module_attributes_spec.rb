# encoding: utf-8
# frozen_string_literal: true

RSpec.describe RuboCop::Cop::ThreadSafety::ClassAndModuleAttributes do
  subject(:cop) { described_class.new }

  it 'registers an offense for `mattr_writer`' do
    inspect_source(cop,
                   ['module Test',
                    '  mattr_writer :foobar',
                    'end'])
    expect(cop.offenses.size).to eq(1)
    expect(cop.messages)
      .to eq(['Avoid mutating class and module attributes.'])
    expect(cop.highlights).to eq(['mattr_writer :foobar'])
  end

  it 'registers an offense for `mattr_accessor`' do
    inspect_source(cop,
                   ['module Test',
                    '  mattr_accessor :foobar',
                    'end'])
    expect(cop.offenses.size).to eq(1)
    expect(cop.messages)
      .to eq(['Avoid mutating class and module attributes.'])
    expect(cop.highlights).to eq(['mattr_accessor :foobar'])
  end

  it 'registers an offense for `cattr_writer`' do
    inspect_source(cop,
                   ['class Test',
                    '  cattr_writer :foobar',
                    'end'])
    expect(cop.offenses.size).to eq(1)
    expect(cop.messages)
      .to eq(['Avoid mutating class and module attributes.'])
    expect(cop.highlights).to eq(['cattr_writer :foobar'])
  end

  it 'registers an offense for `cattr_accessor`' do
    inspect_source(cop,
                   ['class Test',
                    '  cattr_accessor :foobar',
                    'end'])
    expect(cop.offenses.size).to eq(1)
    expect(cop.messages)
      .to eq(['Avoid mutating class and module attributes.'])
    expect(cop.highlights).to eq(['cattr_accessor :foobar'])
  end

  it 'registers no offense for other class macro calls' do
    inspect_source(cop,
                   ['class Test',
                    '  belongs_to :foobar',
                    'end'])
    expect(cop.offenses.size).to eq(0)
  end
end
