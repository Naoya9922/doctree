= Ruby用語集

[[ref:A]]　[[ref:B]]　[[ref:C]]　[[ref:D]]　[[ref:E]]　[[ref:F]]　[[ref:G]]　[[ref:I]]　[[ref:J]]　[[ref:M]]　[[ref:N]]　[[ref:O]]　[[ref:R]]　[[ref:S]]　[[ref:Y]]

[[ref:a]]　[[ref:ka]]　[[ref:sa]]　[[ref:ta]]　[[ref:na]]　[[ref:ha]]　[[ref:ma]]　[[ref:ya]]　[[ref:ra]]　[[ref:wa]]

=== 記号・数字
: %記法
: % notation
  「%」記号で始まる多種多様なリテラル記法の総称。

  参照：[[ref:d:spec/literal#percent]]

: 0 オリジン
: zero-based
  番号が 0 から始まること。

  例えば、
  [[c:Array]] や [[c:Vector]]、[[c:Matrix]] などの要素の番号、
  [[c:String]] における文字の位置、
  といったものは 0 オリジンである。

: 1 オリジン
: one-based
  番号が 1 から始まること。

  例えば、
  エラーメッセージにおける行番号、
  正規表現検索におけるキャプチャーの番号、
  Ruby 2.7 で導入された番号指定ブロックパラメーター、
  といったものは 1 オリジンである。

===[a:A] A

: AWK
  テキスト処理に適したプログラミング言語。
  名称は、開発者である Aho（エイホ）、Weinberger（ワインバーガー）、Kernighan（カーニハン）
  の頭文字を取ったもので、「オーク」と読む。

  AWK のプログラムは、文字列パターンとそれに対応する処理（アクション）の組を必要な数だけ
  記述する。
  テキストデータはレコードセパレーター（改行など）で区切られたレコードに分けられ、レコードごと
  にパターンマッチングが行われる。
  パターンマッチングの前に実行する前処理と後に実行する後処理も記述できる。

===[a:B] B

: Bignum
  Ruby 2.3 系までは、即値で実装されない絶対値の大きな整数オブジェクトが属す
  クラスだった。Ruby 2.4 で Fixnum と共に [[c:Integer]] に一本化された。
  このとき Bignum は形式的には残されたが単なる Integer のエイリアスとなった。

: blade
  Ruby の各種メーリングリストのアーカイブ。

  [[url:http://blade.nagaokaut.ac.jp/ruby/]]

: Bundler
  特定の Ruby アプリケーションで使用する gem とそのバージョンを Gemfile
  および Gemfile.lock という
  ファイルで管理するツール。gem を新規作成するときの雛形を生成する機能もある。
  コマンド名は bundle。

  Bundler 自体も gem として配布されているが、Ruby 2.6 で標準添付
  ライブラリーに追加された。

===[a:C] C

: Coerce
  異なるクラスの値同士の演算を効率よく実装するための手法の一つ。

  例えば新しい数値クラス N を定義し、Integer と N の演算を可能にしたいとする。
  Integer と N の加算を行うと、Integer 側では相手が未知のため、自身を引数に
  まず相手側の N#coerce を呼ぶ。N#coerce では self と引数を、既に加算が定義された
  オブジェクトのペアに変換して返す。Integer 側ではそれらの加算を行う。
  この方法では、N#coerce さえ適切に定義しておけば、Integer 側を変更せずに N という
  数値クラスを定義できる。

  参照：[[m:Numeric#coerce]]

: CRuby
  Ruby の処理系の一つ。C で実装されているのでこの名がある。

  Matz により開発が始められた。
  Matz Ruby とか MRI（Matz’ Ruby Implementation）とも呼ばれる。

: Crystal
  Ruby によく似たオブジェクト指向プログラミング言語。
  型推論を持った静的型付け言語であり、処理系はコンパイラーである。

  [[url:https://ja.crystal-lang.org/]]

: CSI 方式
  CSI は Code Set Independent の頭字語。
  プログラミング言語の処理系が文字列を扱う際のエンコーディングに関する方針の一つ。
  与えられた文字列を単一の内部エンコーデイングに変換するのではなく、さまざまな
  エンコーディングを対等に扱う。そのため、文字列自身がエンコーディングの情報を
  持っている。

  Ruby はバージョン 1.9 以降、CSI 方式である。それまでの Ruby では、文字列は
  エンコーディング情報をもたないバイト列であった。

  →エンコーディング

===[a:D] D

: dRuby
  標準添付ライブラリー [[lib:drb]] によって提供される分散オブジェクトプログラミングの
  ための仕組み。
  何らかの通信手段（TCPSocket や UNIXSocket など）を介して異なるプロセスやマシンの
  間でオブジェクトにアクセスできる。

===[a:E] E

: ENV
  環境変数にアクセスするためのオブジェクト。
  [[c:Hash]] に似たインターフェースを持つ。キーも値も文字列である。
  ENV で環境変数を変更すると Ruby の子プロセスにも引き継がれる。

  参照：[[c:ENV]]

: eRuby
  テンプレートシステムおよびそのフォーマットの名称。
  任意のテキストに Ruby のコードを埋め込むことができる。
  名称は embedded Ruby から。

  テンプレートファイルの標準の拡張子は .erb。

  標準添付ライブラリー [[lib:erb]] で提供される [[c:ERB]] がテンプレートエンジン
  となる。これ以外にもサードパーティーのテンプレートエンジンが複数ある。

: European Ruby Conference
  [[url:https://euruko.org/]]

===[a:F] F

: FFI: Foreign function interface

  他言語関数インターフェース。
  二つのプログラミング言語間で相手の関数を呼び出したりするための仕組み。

  Ruby ではライブラリーの C 拡張部分の機能を呼び出すのに使われたりする。
  相手側は、FFI に対応していれば C である必要はなく、例えば Rust で
  書くこともできる。

: Fixnum
  Ruby 2.3 系までは、整数は即値で実装されるものが Finxnum のインスタンスであり、
  そうでないものは Bignum のインスタンスであった。[[c:Integer]] はこれらをまとめる
  抽象クラスだった。
  Ruby 2.4 でこれらが Integer に統合され、Fixnum と Bignum は Integer の
  単なるエイリアスとなった。

: flonum
  CRuby において、[[c:Float]] が表す浮動小数点数のうち、即値として実装されているもの。

  演算が高速で省メモリーという特長がある。

===[a:G] G

: GC
  ＝ガーベジコレクション

: gem
  RubyGems の仕組みでパッケージされたライブラリー。

  また、RubyGems のコマンドの名前でもある。

  参照：[[lib:rubygems]]

===[a:I] I

: irb
  組込みの対話型 Ruby 実行環境およびそのコマンド名。

  irb コマンドで起動し、Ruby の式を入力すればその場で評価して結果を表示する。
  名称は interactive Ruby から。

  参照：[[lib:irb]]

: is-a 関係
  Ruby では [[m:Object#is_a?]] で確認できる関係。

  たとえば、配列オブジェクトは [[c:Array]] クラスや [[c:Enumerable]] モジュール、[[c:Object]] クラス
  などに対して is_a? の関係にある。

: ISO/IEC 30170
  JIS X 3017 の原規格。

===[a:J] J

: JIS X 3017
  日本工業規格「プログラム言語 Ruby」。ISO/IEC 30170 を JIS 化したもの。
  2011 年制定、2013 年改正。

: JRuby
  Java で実装された Ruby の処理系。
  Ruby スクリプトから Java のクラスを利用したり、Java プログラムから Ruby を
  呼ぶなど、Ruby と Java が容易に連携できるという特長がある。

  [[url:https://www.jruby.org/]]

===[a:M] M

: Matz
  Ruby の作者、まつもとゆきひろ（松本行弘）氏。

: Matz Ruby
  ＝CRuby

: mix-in
  ＝ミックスイン

: MRI: Matz’ Ruby Implementation
  ＝CRuby

: mruby
  組込み向けの Ruby 仕様および処理系。省メモリー性など、機器組み込みや
  アプリケーションソフト組込みに適した特徴を持つ。

  [[url:https://mruby.org/]]

: main
  トップレベルにおける self。[[c:Object]] クラスのインスタンスである。

===[a:N] N

: nil
  [[c:NilClass]] の唯一のインスタンス。また、そのオブジェクトを指す擬似変数の名前。
  論理値としては偽である。

  Ruby の仕様上はただのオブジェクトの一つであり、特定の意味付けをもたないが、
  しばしば「何かが無い」ことや「何かが失敗した」ことなどを表すのに用いられる。

===[a:O] O

: Opal
  Ruby のコードを JavaScript に変換するソフトウェア。

  [[url:https://opalrb.com/]]

  ウェブ上で Ruby コードが試せる TryRuby は、バージョン 4 で Opal を
  採用し、ブラウザー上でコードを動作させるようになった。

  [[url:https://try.ruby-lang.org/]]

===[a:R] R

: Rake
  Ruby 標準添付のビルドツール。
  Rakefile というファイルにタスクを記述する。
  コマンド名は rake。

  Rakefile を記述する言語はドメイン特化言語（DSL）であるが、いわゆる
  内部 DSL であり、Ruby のコードである。

  参照：[[lib:rake]]

: rbenv
  複数バージョンの Ruby をインストールし、切り替えて使うための
  ツールの一つ。Linux、macOS などで動作する。

  [[url:https://github.com/rbenv/rbenv]]

: RD（Ruby Document format）
  Ruby スクリプト中に記述することを念頭に作られたドキュメントフォーマット。

: RDoc
  Ruby スクリプトからそのスクリプトのドキュメントを生成するシステム。

  クラス、モジュール、メソッドの情報を抜き出し、またそこに所定の方法で記述された
  コメントを抽出して処理し、合わせてドキュメントの HTML を生成する。

  参照：[[lib:rdoc]]

: refinement
  既存のクラスやモジュールを特定のスコープでのみ改変する仕組み。

  参照：[[m:Module#refine]]、[[m:Module#using]]、[[m:main.using]]

: Ruby Central
  Rubyのサポートと世界の Ruby コミュニティーの支援を専門とする非営利組織。
  RubyConf（International Ruby Conference）と RailsConf を開催している。

  [[url:https://rubycentral.org/]]

: RubyConf
  2001 年から年次開催されている Ruby の祭典。

  [[url:https://www.rubyconf.org/]]

: RubyGems
  gem のインストール、アンインストール、アップグレードなどの管理を行う
  ライブラリーであり、ツール。
  Ruby 1.8 までは外部ライブラリーであったが、Ruby 1.9 で取り込まれた。

  参照：[[lib:rubygems]]

: RubyGems.org
  gem のホスティングサービス。

  [[url:https://rubygems.org/]]

: Rubyist
  Ruby 使用者。

: Rubyist Magazine
  日本 Ruby の会が 2004 年から不定期に刊行する Rubyist のためのウェブマガジン。
  愛称「るびま」。

  [[url:https://magazine.rubyist.net/]]

: RubyKaigi
  2006 年に始まった日本で年次開催されるイベント。

  [[url:https://rubykaigi.org/]]

: Ruby アソシエーション
  Ruby の普及と発展のための日本の非営利団体（一般財団法人）。2011 年設立。

  [[url:https://www.ruby.or.jp/ja/]]

: Ruby ビジネス・コモンズ
  [[url:https://www.facebook.com/rubybizcommons]]

===[a:S] S

: self
  現在のコンテキストにおいて、暗黙のレシーバーとなるオブジェクト。

  また、そのオブジェクトを指す擬似変数の名前。

: shebang
  シバンまたはシェバンと読む。
  一般に Unix 系 OS のスクリプトにおいて、第 1 行に配置される #! で始まる行をいう。
  スクリプトを処理すべき処理系やそのコマンドラインオプションを指定するのに
  用いられる。

  Ruby スクリプトでのコマンドラインオプションの指定は非 Unix 系の OS でも
  有効である。

===[a:Y] Y

: YARD
  Ruby 用ドキュメント生成ツール。

  [[url:https://yardoc.org/]]


===[a:a] あ

: アクセッサー
: accessor
  オブジェクトの特定のインスタンス変数について、その値を読み出すメソッドと
  その値を設定するメソッドの総称。

  メソッド名はインスタンス変数の識別子と同じものを使う習慣がある。
  例えば @foo の値を読み出すメソッドは foo とし、@foo に値を設定する
  メソッドは foo= とする。

: 浅い複製
: shallow copy
  配列を dup メソッドで複製したとき、配列の要素オブジェクトまでは複製されない。
  ハッシュも同様である。このような複製をいう。

  ↔深い複製

: アリティー
: arity
  メソッドやそれをオブジェクト化した [[c:Method]] オブジェクトの仮引数の数、および
  ブロックやそれをオブジェクト化した [[c:Proc]] オブジェクトの
  ブロックパラメーターの数。

  [[m:Method#arity]] や [[m:Proc#arity]] で得ることができる。

  引数などの数が 1 個、2 個、3 個であることをそれぞれ unary、binary、
  ternary と呼ぶことから作られた語。

: アンコメント
: uncomment
  コメントアウトを解除すること。非コメント化。

  →コメントアウト

: 安定ソート
: stable sort
  同順位となる二つの要素の順序がソート前後で保たれるソート。

  [[m:Enumerable#sort]] などのメソッドは非安定ソート（unstable sort）である。

: 委譲
: delegation
  あるオブジェクトのメソッドの実際の処理を他のオブジェクトに
  ゆだねること。

  例えばハッシュ的なインターフェースを持つクラスの設計では、インスタンス変数
  に保持したハッシュに呼び出しを丸投げすることで実装が簡素化できる。

  標準添付ライブラリーには、委譲を支援する [[lib:delegate]] や
  [[lib:forwardable]] がある。

: イテレーター
: iterator
  一般には繰り返し（反復）を抽象化する仕組み全般を指す広い概念であるが、
  Ruby 用語としては、もっぱら繰り返し処理のためのブロック付きメソッドの
  ことを指す。

  繰り返しのためのブロック付きメソッドでは、一回のメソッド呼び出しに
  よって、メソッドがブロックを繰り返し実行する。メソッド自体が反復を
  行うので内部イテレーターに分類される。

  一方、[[c:Fiber]] を使って繰り返し処理を行うオブジェクトを作る
  ことができるが、こちらは一回のメソッド呼び出しで一回分の反復を行う
  ので外部イテレーターに分類される。

: インスタンス
: instance
  あるクラスに属すオブジェクトをそのクラスのインスタンスという。

  あるオブジェクトがあるクラスのインスタンスであるかどうかは [[m:Object#instance_of?]] で
  確認できる。

  なお、あるクラスの子孫クラスのインスタンスをも元のクラスの
  インスタンスと呼ぶ場合があるので注意が必要である。

: インスタンス変数
: instance variable
  オブジェクト固有の変数。識別子の前に @ が一つだけ付いた形式の名前を持つ。

  同じクラスのインスタンスの同名の変数でもインスタンスが異なれば別の変数である。

  メソッド定義の中など、そのオブジェクトが self となるような場所では
  参照・代入が可能である。そうでない場所では、メソッドを使って
  間接的に参照・代入できる。

  →アクセッサー

  参照：[[ref:d:spec/variables#instance]]

: インスタンスメソッド
: instance method
  クラスやモジュールに定義されるメソッドは、定義方法により、そのクラスや
  モジュール自身をレシーバーとするものと、インスタンスをレシーバーとする
  ものに分けられる。
  前者をクラスメソッド、後者をインスタンスメソッドと呼ぶ。
  （ここでいうインスタンスは、当該のクラスやその子孫クラス、あるいは当該の
  モジュールを include したクラスやその子孫クラスのインスタンスを指す）

  特異メソッドは特異クラスから見ればインスタンスメソッドである。
  クラスメソッドはクラス（やモジュール）の特異メソッドであるから、
  そのクラス（やモジュール）の特異クラスから見ればインスタンスメソッドと言える。

  つまり、インスタンスメソッドやクラスメソッドという用語は、何かクラスや
  モジュールを念頭に置き、そこから見た用語である。

: 宇宙船演算子
: spaceship operator
  [[c:Comparable]] モジュールが利用する、二つのオブジェクトの順序関係を表す
  演算子 <=> の俗称。

: 埋め込みドキュメント
: embedded document
  ソースコード中の =begin 行から =end 行まで。コメントとみなされ実行されない。

  その名の通り、この部分にコードのドキュメントを記述することが
  期待されている。

  参照：[[ref:d:spec/lexical#embed]]

: エイリアス
: alias
  ＝別名

: エンコーディング
: encoding
  何らかの情報を何らかの記号体系で表現することを指す非常に広い概念だが、
  Ruby で単に「エンコーディング」と言ったときには文字列のエンコーディングを
  指すことが多い。
  これは文字の並びをどのようにバイト列で表現するか、という方法のこと。
  たとえばおなじ「あ」という文字でも、UTF-8 と UTF-16LE と Shift_JIS と
  では全く異なるバイト列になる。これがエンコーディングの違いである。

  Ruby の文字列オブジェクトはエンコーディング情報を持つ。つまり自身が
  何のエンコーディングであるかを知っている。
  エンコーディング情報は [[c:Encoding]] オブジェクトで表される。

  スクリプトも何らかのエンコーディングに基づいて記述されているが、これは
  スクリプトエンコーディングと呼ばれる。

  ファイルなど外部とテキストのやり取りをする際、エンコーディングを指定する
  ことができる。

  →文字コード

: 演算子
: operator
  演算子はプログラムの構文上の要素で、項とともに式を構成する。

  Ruby の演算子には多様なものが含まれる。
  「x + y」の「+」のような算術演算子や「x == y」の「==」のような
  関係演算子は、メソッド呼び出しの構文糖衣であり、再定義もできる。
  「x and y」「x || y」の and や || はメソッド呼び出しとは関係が
  なく、再定義もできない。
  代入式「n = 1」における「=」は代入演算子である。
  「str.size」「user&.name」といったメソッド呼び出しにおける
  「.」「&.」も演算子である。
  「[*0..9]」におけるいわゆる splat 展開の * や、
  [[c:Proc]] オブジェクトをブロックとして渡す「strs.map(&:length)」に
  おける & も演算子である。
  defined? のように、見た目がメソッドのような演算子もある。

  参照：[[d:spec/operator]]

: 汚染
: taint
  Ruby のオブジェクトは「汚染されているか否か」という状態を持ち、
  Ruby のセキュリティー機構はこの汚染状態によってメソッド呼び出し等に
  制限を課していた。
  しかし、Ruby 2.7 でこの機構は実質的に無効化された。

  参照：[[d:spec/safelevel]]

: 鬼雲
: Onigmo
  Ruby 2.0 以降採用されている正規表現エンジン。鬼車のフォーク。

  参照：[[d:spec/regexp]]

: 鬼車
: Oniguruma
  Ruby 1.9.x で採用されていた正規表現エンジン。

: オーバーライド
: override
  Ruby では上位クラスや include したモジュールで定義されているメソッドを
  再定義することを「オーバーライドする」という。
  オーバーライドしたメソッドからは super によって元のメソッドを呼び出すことができる。

: オブジェクト
: object
  Ruby ではすべてのデータはオブジェクトである。
  すべてのオブジェクトは何らかのクラスに属し、メソッド呼び出しに
  反応する。

  しかし、メソッド、ブロック、変数・定数、式、演算子、識別子、コンテキスト、
  スコープ、名前空間、プログラム（スクリプト）といったものは
  オブジェクトではない。

  ただし、メソッド、ブロックはそれぞれオブジェクト化できる。

  なお、「[[c:String]] オブジェクト」のような、クラス名＋「オブジェクト」の
  形の表現は、そのクラスのインスタンスを指す。

: オブジェクト ID
: object id
  Ruby ではすべてのオブジェクトは自身を一意に特定する整数を持つ。
  これをオブジェクト ID と呼ぶ。
  [[m:Object#object_id]] メソッドで得られる。
  オブジェクトが同一であることとオブジェクト ID が一致していることは等価である。

: オブジェクト空間
: object space
  オブジェクトが漂っている仮想的な空間。処理系の実装に関する概念ではなく、
  そういうメモリー空間があるわけではない。
  即値で実装されたオブジェクトも、概念的にはオブジェクト空間内に存在する。

  オブジェクト空間に関する情報は [[c:ObjectSpace]] クラスで得ることが
  できる。

: オープンクラス
: open class
  組込みのクラスが再定義可能であること。
  Ruby は String や Integer といった基本的なクラスも自由に改変できる。

  しかし、既存のクラスやモジュールをむやみに改変することは思わぬバグを
  生みやすい。
  そのため、改変の効果を局所化する refinement という機構がある。

  → refinement

: オペランド
: operand
  演算子式において演算の対象となる式。式 a + b * c において、+ の
  オペランドは a と b * c の二つである。

  被演算子ともいう。

  Ruby の演算子式の中にはメソッド呼び出しに還元されるものがあり、その場合、
  オペランドはメソッドのレシーバーや実引数となる。

  演算子はオペランドの数によって単項演算子、二項演算子、三項演算子に
  分類される。

: 親クラス
  ＝スーパークラス

===[a:ka] か

: 下位クラス
: subclass
  ＝サブクラス

: 返り値
: return value
  メソッドが呼び出し側に返すオブジェクトのこと。戻り値ともいう。

  また、式の評価値のことを式の返り値と呼ぶこともある。

: 可視性（メソッドの）
: method visibility
  メソッドの呼び出し可能性。Ruby のメソッド可視性は public、private、protected の
  三種類があるが、Java における private、protected とは全く異なるので注意が
  必要である。

  参照：[[ref:d:spec/def#limit]]

: 型
: type
  →データ型

: ガーベジコレクション
: garbage collection
  オブジェクトがどこからも参照されなくなったとき、そのオブジェクトが占める
  メモリー領域はガーベジ、つまりゴミと呼ばれる。
  ガーベジがたまると、やがて新たなオブジェクトが生成できなくなってしまう。
  そうなる前にゴミを集めてメモリーを解放してやるのがガーベジコレクションである。
  GC と略す。

  [[c:GC]] モジュールでガーベジコレクションが制御できる。

: 可変長引数
: variadic
  メソッドに与えられる実引数の数が固定でないこと。
  「可変個引数」と呼ぶほうが内容に合っているが、「可変長引数」という用語の
  ほうが普及している。

  英語の variadic は形容詞である。

: 空
: empty
  [[c:Array]] や [[c:Hash]]、[[c:Struct]] のような要素を持つクラスでは、要素が無いことを
  「空（から）」と呼ぶ。

  また、[[c:String]] クラスでは、長さが 0 のインスタンスを「空文字列」と呼ぶ。

  空であることを確認するメソッドの名前にしばしば empty? が使われる。

: 仮引数
: formal argument
  メソッド定義において、メソッド呼び出しで与えられた実引数を
  受け取る一種の変数。

  「引数」は「いんすう」よりも「ひきすう」と読まれることが多い。

  スコープはローカル変数と同じであり、再代入もできる。
  仮引数に代入を行っても呼び出し側には影響を与えない。

  →実引数

: 環境変数
: environment variable
  OS がその上で動作するプロセスに対して提供する文字列型のデータ共有機能。
  名前と値の組からなる。

  Ruby では [[c:ENV]] というハッシュに似たオブジェクトで環境変数の
  参照・変更・追加ができる。

  → ENV

: 関数
: function
  Ruby には文法上、関数という概念は無い。
  ただし、①レシーバーの状態に依らずに動作し、かつ②レシーバーを変更しないメソッドを「関数的」と呼ぶことがある。

  →モジュール関数

: キーワード引数
: keyword argument
  記述順ではなくキーワードによって特定される引数。

: 組み込みクラス
: built-in class
  [[c:Array]]、[[c:String]] など Ruby 処理系に組み込まれているクラス。
  ライブラリーを require することなく使うことができる。

  参照：[[lib:_builtin]]

: 組み込みライブラリー
: built-in library
  Ruby 本体に組み込まれているライブラリー。require せずに使うことができる。

: クラス
: class
  オブジェクトを生み出し、そのオブジェクトの振る舞いを規定するもの。
  Ruby ではクラスも [[c:Class]] クラスのオブジェクトである。

  Class クラスは [[c:Module]] クラスの下位クラスであり、モジュールとしての性質も
  おおむね受け継いでいる。ただし、一部のメソッドが未定義にされているうえ、
  他のクラスやモジュールに include するといったこともできない。
  つまり、Module と Class の間にはリスコフの置換原則は成り立っていない。

: クラスインスタンス変数
: class instance variable
  クラスもオブジェクトであるから、当然インスタンス変数を持ちうる。
  これがクラスインスタンス変数である。

  クラス変数とは異なる。

: クラス変数
: class variable
  識別子の前に「@@」が付いた形式の名前を持つ変数。

  クラスに属し、サブクラスや include したモジュールと共有される。

  当該のクラスやそのサブクラス、あるいは include したモジュール
  の定義の中で参照・代入できるほか、インスタンスメソッドの定義中
  でも参照・代入できる。

  クラスインスタンス変数とは異なる。

  参照：[[ref:d:spec/variables#class]]

: クラス名
: class name
  クラスの名前。クラスを定義すると、同名の定数が定義され、そのクラスが
  代入される。

: クラスメソッド
: class method
  クラスの特異メソッドをそのクラスのクラスメソッドと呼ぶ。

  →特異メソッド

: グローバル変数
: global variable
  グローバルスコープを持つ変数。
  $ で始まる名前を持つ。

  ただし、特殊変数（すべて名前が $ で始まる）の
  中にはグローバルスコープでないものもある。

  参照：[[ref:d:spec/variables#global]]

: 継承
: inheritance
  クラスの機能（メソッドなど）が下位クラスに受け継がれること。
  Ruby のクラスはただ一つのスーパークラスしか持ち得ないため、とくに
  「単一継承」と呼ばれる。
  継承とは別に、モジュールの機能を引き継ぐミックスインという仕組みがある。

  クラス C2 がクラス C1 の下位クラスであるとき、「C2 は C1 を継承している」と
  いう。クラス間のこのような関係を「継承関係」と呼ぶ。

  →サブクラス、ミックスイン

: ゲッター
: getter
  インスタンス変数の値を取り出すメソッド。
  インスタンス変数名から「@」を削除したメソッド名とする習慣がある。

  →アクセッサー

: 子クラス
: subclass
  ＝サブクラス

: コーディング規約
: coding convention
  プログラムの書き方についての取り決め。
  複数人での開発ではコーディング規約を設けることが多い。
  スペースや改行の入れ方、1 行の最大文字数、コメントの記法、プログラム要素の配列順、といった
  見た目に関すること、変数・メソッドなどの命名方針、ファイルパスなど。

: コメントアウト
: comment out
  コメント化。プログラムの一部分を（コメント化記号の挿入により）コメントにすること。
  不要になった処理を記録して残しておきたい場合や、デバッグ目的などで行われる。
  元に戻すことはアンコメントと呼ばれる。

  →アンコメント

: コレクション
: collection
  配列、ハッシュ、集合（[[c:Set]] オブジェクト）など、
  要素の集まりを表すオブジェクト。コンテナーとも呼ばれる。

: コロン記法（ハッシュの）
  ハッシュ式においてキーがシンボルである場合に、キーと値のペアを key: value の
  形式で表す記法。ロケット演算子による記法と混在させることもできる。

  参照：[[ref:d:spec/literal#hash]]

  →ロケット演算子

: コンテナー
: container
  ＝コレクション

===[a:sa] さ

: 再定義
: redefinition
  既に定義されているメソッドなどを改めて定義すること。

: サブクラス
: subclass
  クラス A から継承によって新しいクラス B が作られたとき、
  B を A のサブクラスと呼ぶ。
  「子クラス」「下位クラス」「派生クラス」と呼ぶこともある。

  サブクラスのサブクラスなど継承の連鎖の先のクラスをすべて含めて「サブクラス」と
  呼ぶ場合もあるが、この場合は「子孫クラス」という用語が使える。

  ↔スーパークラス

  →継承

: 式展開
: string interpolation
  文字列などのリテラルの中に決まった書式で式を記述すると、式を評価した値が
  文字列化されて埋め込まれること。

  文字列リテラル、ヒアドキュメント、シンボルリテラル、文字列配列リテラル、
  シンボル配列リテラル、正規表現リテラルなどで使える。

  参照：[[d:spec/literal]]

: 識別子
: identifier
  プログラム中に書かれる変数・定数・メソッド・クラス・モジュールなどの名前。

: 自己代入
: self assignment
  代入の一種で、他の値との演算結果を代入するもの。
  自己代入式 a += 1 における += のように、演算子と = をつなげた形の
  自己代入演算子を使う。
  変数・定数などへの代入のほか、代入メソッドでも自己代入が書ける。

: 実引数
: actual argument
  メソッド呼び出しにおいてメソッドに与えられる値。

  「引数」は「いんすう」よりも「ひきすう」と読まれることが多い。

  実引数には式を与える。すべての式が評価されてからメソッドが呼び出される。

  →仮引数

: 集合オブジェクト
  [[c:Set]] クラスのインスタンス。

: 述語メソッド
: predicate method
  返り値を真偽値として用いるためのメソッド。
  メソッド名の末尾に ? を付ける習慣がある。

  true/false を返すとは限らず、真である場合に、true 以外のオブジェクトを
  返すことで、単なる真偽を越えた情報を与えるものもある。

: 上位クラス
: superclass
  ＝スーパークラス

: 条件演算子
: conditional operator
  条件式・真式・偽式の三つの項を取り、条件式の値が真のときは真式を評価して
  その値を返し、条件式の値が偽のときは偽式を評価してその値を返す。

  条件式 ? 真式 : 偽式 の形で記述する。

  Ruby では三つの項を取る演算子は他にないため、しばしば「三項演算子」とも
  呼ばれる。

: 条件式
  値を真偽値として用いる式。if、unless、while、until のあとなどに書かれる。

: 初期化
: initialize
  オブジェクトが生成されるとき、initialize という名の private メソッドが
  呼ばれる。このメソッドで行う処理をオブジェクトの初期化と呼ぶ。

  また、変数・定数に初めて値を代入することをその変数・定数の初期化と呼ぶ。

: 処理系
  ある言語のプログラムを読み込み、解釈し、実行するプログラムをその言語の処理系という。
  その言語の「実装」と呼ぶこともある。

  Ruby の処理系は CRuby を代表として、いくつかある。

: 真偽値
: Boolean value
  Ruby ではどんなオブジェクトも真または偽である。
  nil と false だけが偽であり、空文字列、空配列も含め、他のすべての
  オブジェクトは真である。

  Ruby では、値の型・種類に関わりなく、値の真偽性を利用するときにその値を
  真偽値と呼ぶ。この用語集では「真偽値」をこの意味でのみ用いている。

  しかし、「真偽値」を true と false に限って用いる場合もあるので注意が
  必要である。

: シンタックスシュガー
: syntax sugar
  ある構文に対し、プログラムの意味論上同じものを、より分かりやすい（あるいは読み書き
  しやすい、あるいは簡素な）別の構文で記述できるようにしたとき、元の構文のシンタックス
  シュガーと呼ぶ。

  例えば Ruby では加算もメソッド呼び出しであるが、x.+(y) という通常のメソッド呼び出し
  構文のほかに、より親しみやすい x + y という構文がシンタックスシュガーとして
  用意されている。

  構文糖衣、構文糖、糖衣構文とも呼ばれる。

: シンボル
: symbol
  文字列と一対一に対応する、Ruby の処理系内部で整数により管理されるオブジェクト。

  イミュータブルであり、同じ内容であれば必ず同一である。

  シンボルのリテラルは文字列のリテラルと似ている。

  Ruby の処理系内部では、効率上の理由からメソッド・変数・定数・クラス・モジュール
  などの名前を整数で管理しているが、この整数がまさにシンボルのもつ整数値である。

  参照：[[c:Symbol]]

: シンボル配列
  要素がシンボル（[[c:Symbol]] オブジェクト）だけからなる配列。
  配列式としては % 記法で書くこともできる。

  参照：[[ref:d:spec/literal#percent]]

: 数値オブジェクト
  [[c:Numeric]] クラスのサブクラスのインスタンス。

: スクリプト
: script
  いわゆる軽量言語のプログラムをこう呼ぶことが多い。

  また、平仮名、片仮名、漢字、ラテン文字、アラビア文字、といった
  文字体系もスクリプトと呼ぶ。この意味では「用字系」という用語も
  使われる。

: スクリプト言語
: scripting language
  最近は境界が曖昧になっているが、簡易なテキスト処理などを念頭において
  作られたプログラミング言語のことをこう呼んだ。
  Ruby は現代ではさまざまな用途に使われているが、当初は AWK や Perl などの
  ようなスクリプト言語として設計された。
  このことは作者による 1999 年の書籍のタイトル
  『オブジェクト指向スクリプト言語Ruby』にも表れている。

: スクリプトエンコーディング
: script encoding
  そのスクリプトファイル自体のエンコーディング。

  →エンコーディング

: スクリプト探索パス
  ＝ロードパス

: スコープ
: scope
  変数・定数・メソッドなどが参照（・代入）可能な、コード上の範囲。

  Ruby の定数やグローバル変数はプログラムのどこからでも参照・代入
  できるため、
  グローバルスコープと呼ばれる。インスタンス変数はそのインスタンスが
  self となるような場所であればどこででも参照・代入できる。
  一方、ローカル変数はローカルスコープという極めて局所的なスコープを
  持つが、これはコードの見た目だけで決まるレキシカルスコープである。

  →レキシカルスコープ

: スタックトレース
: stack trace
  プログラム実行のある時点において、そこに至るメソッド呼び出し元情報を遡るデータ。
  バックトレースともいう。

  [[m:Kernel.#caller_locations]]、[[m:Kernel.#caller]] で現時点までの
  スタックトレースを得ることができる。

  また、例外オブジェクトは例外が発生した時点までのスタックトレースを保持しており、
  [[m:Exception#backtrace]] や [[m:Exception#backtrace_locations]] で
  取り出すことができる。

: スーパークラス
: superclass
  クラス B がクラス A のサブクラスであるとき、A を B のスーパークラス
  と呼ぶ。
  「親クラス」「上位クラス」と呼ぶこともある。

  Ruby では [[c:BasicObject]] を除くすべてのクラスがただ一つの
  スーパークラスを持つ（BasicObject はスーパークラスを持たない）。
  スーパークラスは [[m:Class#superclass]] で得られる。

  スーパークラスのスーパークラスなど継承の連鎖を遡るクラスをすべて含めて
  「スーパークラス」と呼ぶ場合もあるが、この場合は「祖先クラス（または先祖クラス）」
  という用語が使える。

  ↔サブクラス

  →継承

: スレッド
: thread
  同時に存在して並行的に実行されうる制御の流れ。スレッド間でメモリーは共有される。

  参照：[[d:spec/thread]]

: スレッドセーフ
: thread safe
  複数のスレッドが並行に実行されても問題が起きないこと。

: スレッドローカル
: thread local
  変数のスコープなどがスレッドごとに別々であること。

  例えば特殊変数のうち $0（現在実行中のスクリプトのファイル名）は
  グローバルスコープであり、どのスレッドから参照しても同じ値であるのに
  対し、
  ＄1（正規表現検索における 1 番目のキャプチャー文字列）はスレッドローカル
  であり、スレッドごとに別である。

: 正規表現
: regular expression
  文字列のパターンを表現する言語。
  また、その言語で記述されたもの。

  Ruby は正規表現を表すクラス [[c:Regexp]] があり、正規表現リテラルがある。

  参照：[[d:spec/regexp]]

: 整数
: integer
  Ruby の用語として「整数」を使うときは、数学用語の整数ではなく [[c:Integer]]
  クラスのインスタンスを指すことが多いので注意。

  例えば 1.0（Float）、1r（Rational）、1+0i（Complex）はいずれも
  数学的には 1 を表しており、整数であるが、Integer オブジェクトではない。

  「Integer オブジェクト」と表現すれば誤解が無い。

: セーフレベル
  オブジェクトの汚染状態に基づき、行える操作に制限を加える仕組み。

  参照：[[d:spec/safelevel]]

: セッター
: setter
  オブジェクトのインスタンス変数に値を代入するためのメソッド。
  インスタンス変数名から「@」を削除し、末尾に「=」を付けたメソッド名とする習慣がある。

: 即値
: immediate value
  オブジェクトの実装方法上の概念。参照でなく値そのものをビット列で表現する。
  CRuby では nil、true、false のほか Integer の一部、Float の一部の値が
  即値で実装されている。

  なお、言語によっては「即値」という用語を「リテラル」の意味で使うので注意されたい。

: ソフトウェアテスト
: software testing
  プログラムの正しさや性能を調べること。単に「テスト」ともいう。
  狭義にはテスト用プログラム（テストコード）によって行う自動テストを指す。
  さらに、性能ではなく正しさの検証に限って使われることもある。

  →ユニットテスト、ベンチマークテスト

===[a:ta] た

: 大域脱出
: non-local exit
  Ruby においては、例外の発生もしくは [[m:Kernel.#throw]] によって
  処理の実行が中断されること。
  例外の場合は begin/rescue によって、throw の場合は
  [[m:Kernel.#catch]] によって捕捉されるまで、制御構造やメソッド
  呼び出しの階層もすべて抜ける。

  捕捉されなかった場合はプログラムの実行が終了する。

: 大クラス主義
  クラス設計において一つのクラスにさまざまな機能を盛り込む方針。
  Ruby の Array は、配列、リスト、タプル、集合、スタック（LIFO）、
  キュー（FIFO）などの機能を兼ね備えており、大クラス主義的と言える。

: ダイナミックローカル変数
: dynamic local variable
  定義箇所（最初の代入式の出現箇所）で作成されるローカル変数。

  ローカル変数は静的スコープであり、プログラムの実行前にスコープが
  確定している。
  ブロックの外で定義されているローカル変数はプログラムの実行開始前に
  作成されるが、ブロックの中に定義箇所があるローカル変数はスレッド
  ごとに独立とするためブロックの評価のたびに新たに作成されるように
  なっている。後者がダイナミックローカル変数である。

: 代入
: assignment
  Ruby では、変数への代入はオブジェクトを変数に割り当てること。
  一つのオブジェクトを複数の変数に代入することもできる。
  しかし、逆に一つの変数に複数のオブジェクトを同時に割り当てる
  ことはできない。

  変数・定数への代入とは別に、代入メソッドにより値をレシーバー中に
  格納することも代入と呼ぶ。

  また、代入式によらず、メソッド呼び出し時に仮引数にオブジェクトが
  割り当てられることや、ブロックの評価時にブロックパラメーターに
  オブジェクトが割り当てられることも代入と呼ぶ。

: 代入演算子
: assignment operator
  Ruby では代入も式であり、= は代入演算子と呼ばれる。

: 代入式
: assignment expression
  Ruby では代入も式であり、代入された値がその評価値となる。

: 代入メソッド
: assignment method
  メソッド名の末尾に = が付いたメソッド。メソッド呼び出しが代入式として書ける。

: 多重継承
: multiple inheritance
  あるクラスが複数のクラスの下位クラスになっていること。
  Ruby ではこれを禁止し、多重継承にまつわる問題が起きないようになっている。
  代わりにモジュールの mix-in という仕組みがある。

  →ミックスイン

: 単項演算子
: unary operator
  単一の項に働く演算子。+ - ! not などが該当する。

: 単体テスト
: unit testing
  ＝ユニットテスト

: 短絡評価
: short-circuit evaluation
  論理式の評価において、真偽を確定するための最小限の項の評価しか
  行わないやり方。
  例えば ex1 and ex2 の場合、ex1 の評価値が偽のとき ex2 を評価
  しなくても全体が偽であることが確定するので、ex2 は評価しない。

  Ruby の &&、and、||、or の評価は短絡評価である。

  参照：[[ref:d:spec/operator#and]]、[[ref:d:spec/operator#or]]

: 抽象クラス
: abstract class
  Ruby には言語仕様として抽象クラスはないが、
  直接のインスタンスを持つことを目的とせず、自身のサブクラスに
  インスタンスを持たせるようなクラスを抽象クラスと呼ぶことがある。

  この意味で [[c:Numeric]] は抽象クラスである。
  実際の計算に用いる数値オブジェクトはみな
  Numeric のサブクラスのインスタンスである。

: 定数
: constant
  Ruby における定数は、クラスかモジュールに属し、変数のようにオブジェクトを
  指すもの。
  再代入すると警告が出るため定数と呼ばれる。
  オブジェクトとの紐付けが固定的ということであって、指しているオブジェクトが
  不変であることを意味しない。

  定数のスコープはグローバルである。
  ただし、定数の属すモジュールまたはクラスの階層と参照元の位置関係によっては
  Foo::Bar::BAZ といったパスを書く必要がある。

  参照：[[d:spec/variables]]

: テスト
: testing
  →ソフトウェアテスト

: テスト駆動開発
: TDD: test-driven development
  テストコードを先に記述してから機能を実装するプログラミング手法。

: テストファースト
: test-first programming
  テスト駆動開発において、まず最初にテストコードを記述すること。

: データ型
: data type
  一般には「データがどのようなものであるか」というデータの種類をいう。
  プログラミング言語によるが、整数型、文字列型、配列型といったものが
  考えられる。
  また、データそのものではなく、データを取り扱う変数や仮引数にもデータ型
  を考えることができる。

  データ型を単に「型」と呼ぶことも多い。

  Ruby では変数・定数・仮引数・ブロックパラメーターには型の制限がなく、
  どんな種類のオブジェクトも受け入れる。

  Ruby の仕様には「データ型」という概念はなく、「〜は○○型である」という
  表現もあまりされないが、オブジェクトが属すクラスはデータ型を表していると
  考えられる。
  たとえば文字列オブジェクトは [[c:String]] 型、浮動小数点数オブジェクト
  は [[c:Float]] 型であると言える。

  クラスには継承関係があるため、浮動小数点数は Float 型であると
  同時に [[c:Numeric]] 型であるとも言える。

  また、クラスに include されているモジュールもまた、データを特徴
  づけるものであり、データ型を表していると考えることができる。
  たとえば Float、Integer、[[c:Rational]] のような数値クラスや
  String、[[c:Time]] といった クラスには [[c:Comparable]] モジュール
  が include されており、大小比較に基づくさまざまなメソッドが使える。
  これらのクラスのインスタンスを Comparable 型であると言っても差し支え
  ないだろう。

  同様に、Array、[[c:Enumerator]]、[[c:Hash]] といったクラスの
  インスタンスは [[c:Enumerable]] 型であると言うことができる。

  このような意味でオブジェクトが特定のクラスやモジュールの表す型に
  属すことは [[m:Object#is_a?]] メソッドで確認できる。

  さらには、特定の名前のメソッド（群）が呼び出し可能であることを型と
  みなす考え方もあり「ダックタイピング（duck typing）」と呼ばれる。
  特定の名前のメソッドが呼び出し可能であることは
  [[m:Object#respond_to?]] メソッドで確認できる。

  Ruby 2.7 で試験的に導入された case/in 式では、オブジェクトの
  パターンという概念が出てくる。オブジェクトのパターンは、たとえば
  「第 1 要素が Integer であり、第 2 要素がキー :name を持つ Hash で
  ある配列」といった、コンテナーオブジェクトの内部に立ち入った複雑な
  ありさまをも表すことができる。
  このオブジェクトのパターンも一種の型であると考えられる。

: デバッガー
: debugger
  プログラムのデバッグを支援するツール。

  あらかじめ設定した地点（ブレークポイント）でプログラムの実行を
  一時停止させたり、1 行ずつ実行させたりしながら、
  対話的に式の値を表示させることができる。

  →ブレークポイント

: 同一性
: identity
  Ruby における値の同一性は、それらの値が同じオブジェクトである（つまり
  オブジェクト ID が一致する）ことを意味する。
  [[m:Object#equal?]] メソッドで判定できる。

  →オブジェクト ID

  →同値性

: 同値性
  同一性よりもゆるい概念であり、二つの値が何らかの意味で同じであること。
  関係演算子 == で判定される関係。

  == はメソッドであり、その同値性判定は左辺のオブジェクトのクラスにより
  規定される。

  [[c:String]] オブジェクト同士では、同じエンコーディングで同じ文字の
  並びなら同値である（エンコーディングが違っても同値となる場合はある）。

  また、1 と 1.0 と 1r は、クラスは違うが同値である。
  これは「同じ数を表す数値オブジェクトは同値」という原理で各数値クラスが
  設計されているからである。

  なお、ここでは == による同値性について述べたが、これとは別に、
  eql? メソッドによる同値性もある。これはハッシュのキーとして同じと
  みなすことを意味する。1.eql?(1.0) は false であり、ハッシュの
  キーとして 1 と 1.0 は区別される。

  →同一性

: 特異クラス
: singleton class
  すべてのオブジェクトには自身が属すクラスとは別に、オブジェクト固有の
  クラスがあり、特異クラスと呼ばれる。

  参照：[[m:Object#singleton_class]]

: 特異メソッド
: singleton method
  オブジェクト固有のメソッド。
  オブジェクトの特異クラスのインスタンスメソッドである。

: トップレベル
: top level
  スクリプトの一番外側のコンテキスト。つまり、すべてのモジュール定義、
  クラス定義、メソッド定義の外側である。

  トップレベルでは main が self となる。

===[a:na] な

: 名前空間
: namespace
  メソッドや定数の名前の衝突を避ける仕組み。
  クラスやモジュールは一つの名前空間を作る。

: 名前重要
  プログラミングでは、変数名、メソッド名、クラス名、などを決める「命名」の機会が多い。
  「名前重要」は、機能にふさわしい名前を付けることをとりわけ重要視する方針。
  Matz はこれを設計上の座右の銘としている。

  参照：[[url:https://ja.wikisource.org/wiki/%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9E%E3%81%8C%E7%9F%A5%E3%82%8B%E3%81%B9%E3%81%8D97%E3%81%AE%E3%81%93%E3%81%A8/%E5%90%8D%E5%89%8D%E9%87%8D%E8%A6%81]]

: 日本Rubyの会
  Ruby の開発者・利用者の支援を行っている一般社団法人。

  [[url:https://ruby-no-kai.org/]]

: ヌル文字
: null character
  ASCII（ISO/IEC 646）や Unicode などに含まれる制御文字の一つ。
  ASCII では 0x00 が、Unicode では U+0000 がこれに当たる。
  「ナル文字」とか、ASCII での略号を用いた「NUL」「NUL 文字」とも表現される。

  ヌル文字の役割や意味はシステムやプログラミング言語などによりさまざまである。
  Ruby では、他の文字と同じように文字列中に含めることができ、文字列を構成する
  文字としては特別扱いされない。
  ただしパス名には使えず、ヌル文字を含んだ文字列を [[m:File.open]] や
  [[m:Pathname.new]] に与えると [[c:ArgumentError]] が発生する。

  他の言語では文字列の終端を意味することがあるので、文字列データをやりとり
  するうえで注意が必要である。

: ネスト
: nesting
  制御構造、ブロックや、クラス・モジュール・メソッドなどの定義の入れ子。

===[a:ha] は

: 破壊的
: destructive
  レシーバーに影響を与えるメソッドは「破壊的」であると呼ばれる。

  例えば文字列オブジェクトについて、そのオブジェクト自身の文字の
  並びを変更することは破壊的といえる。

  配列オブジェクトの場合、ある要素を別のオブジェクトに取り換える操作は
  破壊的であるが、要素に破壊的操作を行うことは配列に対する破壊的操作
  に該当しない。したがって、配列オブジェクトを凍結しただけでは
  その配列から算出される結果を固定することはできない。

: 派生クラス
  ＝サブクラス

: バックトレース
: backtrace
  ＝スタックトレース

: ハッシュ
: hash
  キーに値を対応させたコレクション。言語によっては連想配列とか辞書などと呼ばれる。

  キーとそれに対応する値の組をハッシュの要素と呼ぶ。

  ハッシュは一般には要素の順序が不定だが、Ruby のハッシュは順序が保存される。

  参照：[[c:Hash]]

: ハッシュ値
: hash value
  一般に、データの同一性検証や検索などを目的として、任意のデータからハッシュ関数によって
  作られる小さなデータを元のデータのハッシュ値と呼ぶ。

  Ruby では、任意のオブジェクトに対して [[c:Integer]] のハッシュ値を返す
  [[m:Object#hash]] があり、
  [[c:Hash]] クラスの実装に用いられている。

  ハッシュ値とハッシュ（Hash オブジェクト）を混同してはならない。

  なお、標準添付ライブラリー [[lib:digest]] で提供されるメッセージダイジェストは
  一種のハッシュ関数である。

: パラダイム
: paradigm
  プログラムやその動作をどのように捉えるかという思考の枠組み。
  とくにプログラミングパラダイムともいう。
  プログラミング言語はしばしば何かしら一つ以上のパラダイムに基づいて
  設計される。

  Ruby はオブジェクト指向プログラミングのパラダイムをよりどころとしている。

: 番号指定ブロックパラメーター
: numbered block parameter
  Ruby 2.7 で導入されたブロックパラメーターの記法。
  ブロックパラメーターの宣言をせずに _1、_2 などで第一、第二ブロック
  パラメーターを参照する。

: ヒアドキュメント
: here document
  文字列リテラルの一種で、「<<識別子」のような形の式を含む行の次行から、その
  識別子だけの行の直前までに記述された文字列を「<<識別子」の値とする。
  書き方によって、式展開、バックスラッシュ表記なども可能で、終端の識別子の
  置き方が変えられたりする。

  参照：[[ref:d:spec/literal#here]]

: 引数
: argument
  →仮引数、実引数

: 評価
: evaluation
  式の値を実際に求めること。
  得られた値をとくに評価値ともいう。

  また、ブロックを実行することも評価と呼ぶ。
  ブロックの評価で最後に評価された式の値がそのブロックの評価値となる。

: ファイバー
: fiber
  [[c:Fiber]] オブジェクトで表す軽量スレッド。
  外部からのメソッド呼び出しで実行の継続を制御する。
  ファイバーを用いて外部イテレーターを構成できる。

: 深い複製
: deep copy
  配列、ハッシュなどのコンテナーオブジェクトの複製で、その要素についても
  再帰的に複製するような複製。

  ↔浅い複製

: 浮動小数点数
: floating point number
  実数を符号・仮数部・指数部によって表す表現形式。
  仮数部が表す小数の小数点の位置を指数部の値によって動かしていることに
  なるのでこの名がある。

  Ruby では [[c:Float]] クラスおよび [[c:BigDecimal]] クラスで
  実装されている。

: 振舞い駆動開発（ビヘイビア駆動開発）
: BDD: behavior driven development
  テスト駆動開発から派生したプログラミング手法。
  プログラムの仕様を表現したテストコードを元に開発を進める。

  Ruby の振舞い駆動開発を支援するテストフレームワークとして
  RSpec がある。

: ブレークポイント
: breakpoint
  デバッガーを用いる際、プログラムの実行を一時停止するよう設定
  されたコード上の地点。

  →デバッガー

: ブロック
: block
  メソッドに与えられるコードの塊。

  メソッドを呼び出す際、オブジェクトは実引数として与え、処理は
  ブロックとして渡すことができる。ブロックは一つしか与えることが
  できない。

  イテレーターメソッドでは繰り返したい処理をブロックで与える。
  また、[[m:Enumerable#sort_by]]、[[m:Enumerable#group_by]]、
  [[m:Enumerable#max_by]] などのように、要素に対する「評価関数」
  としてブロックを要求するメソッドもある。
  [[m:Kernel.#open]] メソッドは、ブロックを与えて呼び出した場合、
  ファイルをオープンしてブロックを評価し、ファイルをクローズする。
  クローズが自動的に行われるのでクローズ忘れが防げる。
  ブロック内で例外が発生してもクローズは行われる。
  このように、必ず実行しなければならない終了処理を自動で行うように
  設計されたブロック付きメソッドもある。

  ブロック自体はオブジェクトではないが、ブロックを [[c:Proc]] オブジェクトとして
  オブジェクト化することはできる。

  DSL 用途では、必要なタイミングで呼び出されるべき処理をブロックで
  与えて登録させるメソッドが使われることもある。

: ブロック付きメソッド呼び出し
  メソッドを呼び出す際、実引数の他にブロックを与えることができる。
  このようなメソッド呼び出しをいう。

: ブロックパラメーター
: block parameter
  ブロックが持つ一種の仮引数。JIS X 3017 では「ブロック仮引数」と呼ぶ。

  ブロック引数とは全くの別物である。

: ブロック引数
: block argument
  メソッドに与えられたブロックを [[c:Proc]] オブジェクトとして受け取るため & 付きで
  記述された仮引数。

  ブロックパラメーターとは全くの別物である。

: ブロックローカル変数
  ブロックの | | の中で、セミコロンの後に識別子を書いて宣言した変数。

  ブロックローカル変数のスコープは文字どおりブロック内であり、また、ブロックの
  評価のたびに nil で初期化される。

: 別名
: alias
  メソッドやグローバル変数は別名を持つことができる。

  Ruby の組み込みメソッドには、[[m:Enumerable#map]] と [[m:Enumerable#collect]] の
  ように別名を持つものが多数ある。

  参照：[[ref:d:spec/def#alias]]

: 変数
: variable
  Ruby の変数はオブジェクトに紐付けられた名札のようなもの。
  オブジェクトを入れる箱ではない。
  変数にオブジェクトを紐付けることを代入という。

  複数の変数に一つのオブジェクトを紐付けることもできるが、一つの変数に
  紐付けられるオブジェクトは一つだけである。

  ローカル変数、グローバル変数、インスタンス変数、クラス変数がある。
  変数とよく似たものとして、定数がある。

  →代入

: ベンチマークテスト
: benchmark test
  プログラムの速度性能を調べるソフトウェアテスト。
  ベンチマークテストを行うため、各種の専用ライブラリーがある。

: ポリモルフィズム
: polymorphism
  Ruby においては、同じ名前のメソッドの呼び出しでもレシーバーの属す
  クラスなどによって実行されるメソッドが違いうること。

  原語の発音に近い「ポリモーフィズム」と呼ばれたり、日本語で「多態」とか
  「多相性」などと呼ばれたりもする。

===[a:ma] ま

: マジックコメント
: magic comment
  スクリプトの先頭に（shebang があればそれに続けて）記述し、Ruby の処理系
  に何かを伝えるもの。
  記述したスクリプトのみで有効であり、そこからロードされたスクリプトには
  適用されない。

  スクリプトエンコーディングを示すもの（encoding）、
  文字列リテラルを凍結するかどうかを指定するもの（frozen_string_literal）、
  インデント不整合の警告を出すかどうかを指定するもの（warn_indent）
  がある。

  参照：[[ref:d:spec/m17n#magic_comment]]

: ミックスイン
: mix-in
  モジュールやクラスに対し、他のモジュールの機能を組み込むこと。

  参照：[[m:Module#include]]

: 未定義化（メソッドの）
  メソッドの定義を取り消すこと。[[ref:d:spec/def#undef]] 式もしくは
  [[m:Module#undef_method]] メソッドによって行う。

  [[m:Module#remove_method]] メソッドによるメソッドの削除とは
  異なることに注意。

: メソッド
: method
  クラスやモジュールに定義され、名前を持ち、引数やブロックを与えられて
  呼び出され、一連の処理を行って値を返すもの。
  メソッド自体はオブジェクトではないが、[[c:Method]] オブジェクトとして
  オブジェクト化できる。

: メソッドシグネチャ
: method signature
  メソッドの名前や取りうる引数などについての情報。

: メソッド探索
  あるオブジェクトのあるメソッドが呼ばれたとき、メソッド名をたよりに実際の
  メソッド定義を探索すること。

: メソッド・チェーン
: method chaining
  メソッドの返り値に対しさらにメソッド呼び出しをつなげること。

: メタプログラミング
: metaprogramming
  実行中にクラスやメソッドなどを作成・変更するようなプログラミング手法。
  柔軟な処理が書ける反面、デバッグしづらくなる恐れもある。

  →リフレクション

: 文字コード
: character code
  文字の集合の各要素（文字）に番号やビット列などの記号を割り振る体系。
  文字符号とか符号化文字集合（coded character set）ともいう。
  具体的なビット列の与え方は符号化方式（encoding）と呼ぶ。
  JIS コードや Unicode は一つの文字コードについて複数の符号化方式がある。

  →エンコーディング

: モジュール
: module
  大まかにはクラスからインスタンス生成の機能を省いたもの。
  また、クラスと違い、ミックスインによって他のモジュールやクラスに自身の
  機能を提供することもできる。

  →クラス、ミックスイン

: モジュール関数
: module function
  モジュールのインスタンスメソッドおよび特異メソッドとして二重に定義されている
  メソッド。Math モジュールのメソッドなどがこれにあたる。

  [[m:Module#module_function]] を使って簡単に定義できる。

: 文字列
: string
  [[c:String]] クラスのインスタンス。
  Ruby の文字列は自分自身のエンコーディングを知っている。

  →エンコーディング

: 文字列配列
  要素が文字列（[[c:String]] オブジェクト）だけからなる配列。
  配列式としては % 記法で書くこともできる。

  参照：[[ref:d:spec/literal#percent]]

: 戻り値
: return value
  ＝返り値


===[a:ya] や

: 優先順位（演算子の）
: operator precedence
  たとえば 2 + 3 * 4 という式は 2 + (3 * 4) と解釈されることになっている。これは
  演算子に結合の優先順位があり、+ よりも * のほうが順位が上だからである。

  参照：[[d:spec/operator]]

: 有理数
: rational number
  数学的には「整数分の整数」の形の分数（分母は非零）で表せる数のことだが、
  Ruby で「有理数」といった
  場合、[[c:Rational]] クラスのインスタンスを指すことが多い。

  例えば 1（Integer）、1.0（Float）、1+0i（Complex）は数学的にはすべて 1 を
  表しており、有理数である（整数でもある）が、Rational オブジェクトではない。

: ユニットテスト
: unit test
  メソッドなど、プログラムの小さな単位で行われるソフトウェアテスト。
  単体テストともいう。
  コードの中身には立ち入らず、入力に対する振る舞いをテストコードによって検証する。

  →ソフトウェアテスト

: 予約語
: reserved word
  識別名の形を持ちながら、構文上特別な意味を持つため、
  変数・定数・メソッドなどの名前として自由に使えない文字列。
  if、do、begin、end、nil、__FILE__ といったものが該当する。

  メソッド名の場合、def のあとに書いたり、レシーバーを明示して
  呼び出すなど、構文上、メソッド名であることが明らかな場面では使える場合もある。
  実際 [[c:Range]] クラスには begin、end というインスタンスメソッドが定義されている。
  また、インスタンス変数、クラス変数、グローバル変数は識別名の前に記号が
  付いているため、識別名に予約語を用いることができる。

  参照：[[ref:d:spec/lexical#reserved]]

===[a:ra] ら

: ラッパーライブラリー
: wrapper library
  C 言語などで作られたライブラリーを Ruby から使えるようにするために
  作られた拡張ライブラリーを、元のライブラリーのラッパーライブラリーと呼ぶ。
  単にラッパーと呼ぶことも多い。

  画像処理、数値計算、形態素解析といった分野で、さまざまなライブラリーに対して
  Ruby 用ラッパーライブラリーが作られている。

  また、他のライブラリーを異なる API で使用するために作られたライブラリーを
  こう呼ぶこともある。この場合、元のライブラリーが何の言語で実装されているかは
  問わない。

: リスコフの置換原則
: Liskov substitution principle
  オブジェクト指向プログラミングにおいては、「下位クラスのインスタンスは上位クラスの
  インスタンスの持つ性質をすべて持っていなければならない」とする規則。
  Barbara Liskov らによって提唱された。

  Ruby ではあえてこの原則を破ったクラス設計も行われる。
  たとえば [[c:Class]] クラスは [[c:Module]] クラスのサブクラスだが、Module が持つメソッドの
  いくつかは未定義にされている。

: リテラル
: literal
  プログラム中に直接記述された値のこと。3.14 や "foo" や /\d+/ はリテラル
  だが、1 + 2 はリテラルではない。
  [[m:Math::PI]] も定数参照なのでリテラルではない。

  文字列リテラルが式展開を含む場合、実行時まで値が確定しないため、プログラム中に
  値が直接記述されているとは言えないが、
  便宜的にリテラルの一種として扱うことがある。

  なお、これとは別に、正規表現においてメタ文字ではない文字のことをリテラルと呼ぶ。

  参照：[[d:spec/literal]]

: リフレクション
: reflection
  プログラムの実行中にプログラムについての情報（クラス、モジュール、メソッド、
  変数などについての情報）を得たり、プログラムやその動作を変化させたりすること。
  Ruby では [[m:Object#methods]] でメソッド名の一覧を得たり、
  [[m:Module#define_method]] で動的にメソッドを定義したり、といったことが
  できる。

  プログラムでプログラムを扱う、という意味で「メタプログラミング」とも
  呼ばれる。
  しかし、Ruby では構文を追加・変更するようなメタプログラミングは行えない。

: るびま
  →Rubyist Magazine

: るりま
: rurema
  Ruby の公式日本語リファレンスマニュアルである Ruby Reference
  Manual の愛称。

: 例外
: exception
  [[c:Exception]] クラス（やその子孫クラス）のインスタンス。

: レキシカルスコープ
: lexical scope
  ソースコード上の見た目だけで決まるスコープ。静的スコープとも言う。

  ローカル変数のスコープはレキシカルスコープであるが、インスタンス
  変数はそのインスタンスが self であるような場所ではどこでも同じ
  変数が読み書きできるため、レキシカルスコープではない。

: レシーバー
: receiver
  メソッドは何らかの特定のオブジェクトについて呼び出される。
  このオブジェクトをそのメソッド呼び出しのレシーバーと呼ぶ。
  メソッド呼び出しには、レシーバーを明示的に書くやり方と書かないやり方がある。
  後者では、そのコンテキストの self がレシーバーとなる。

: 連想配列
: associative array
  Ruby ではこの用語は使われず、もっぱら「ハッシュ」と呼ばれる。

  ＝ハッシュ

: ローカル変数
: local variable
  ローカル変数スコープと呼ばれるスコープを持つ変数。
  ローカル変数の参照は、見た目では、引数が無く ( ) も伴わないメソッド呼び出し
  と区別が付かない。
  ローカル変数スコープは、メソッド定義、クラス定義、モジュール定義、
  ブロック、トップレベルの中で最初の代入が現れる位置から末尾までである。
  最初の代入位置以降であっても、メソッド定義、クラス定義、モジュール定義の
  中はスコープ外となる。

  参照：[[ref:d:spec/variables#local]]

: ロケット演算子
: rocket operator
  演算子「=>」の俗称。
  ハッシュ式の記法でキーと値をつないだり、rescue で
  例外オブジェクトを捉えたりするのに用いる。

  Ruby 2.7 以降では case/in の As パターンでも使う。

  参照：[[ref:d:spec/literal#hash]]

: ロードパス
  スクリプトを require、load などで読み込む（ロードする）とき、
  ファイルの位置を絶対パスで与えなくても、ファイル名（拡張子は略せる）や
  どこかからの相対パス、を与えるだけでよい。
  その際、ファイルを探すべき場所が予め設定されている。
  この場所のパスをロードパスという。
  スクリプト探索パスとも言う。

  ロードパスは [[m:$LOAD_PATH]] で参照・変更できる。
  探す場所は普通は複数あるので、ロードパスも配列で与えられている。

  参照：[[m:Kernel.#load]]

===[a:wa] わ

: ワンライナー
: one-liner
  コマンドライン上で、プログラムを処理系の呼び出しまで含めて 1 行で
  表現したもの。

  Ruby では ruby コマンドに -e オプションで Ruby スクリプトを与えることで
  ワンライナーが書ける。

  また、プログラム（だけ）が 1 行で書かれたものもワンライナーと呼ぶことが
  ある。

  参照：[[ref:d:spec/rubycmd#cmd_option]]
