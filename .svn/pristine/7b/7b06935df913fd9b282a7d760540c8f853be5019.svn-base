//
//  WLKTUserAgreementViewController.m
//  wlkt
//
//  Created by slovelys on 2017/4/26.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTUserAgreementViewController.h"
#import "WLKTCourseDetailSectionHeaderView.h"

@interface WLKTUserAgreementViewController ()

@property (strong, nonatomic) NSMutableArray *dataSource;

@end

@implementation WLKTUserAgreementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"用户协议";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [self.dataSource[indexPath.section] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    cell.textLabel.textColor = [UIColor grayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.numberOfLines = 0;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 80)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:20];
        label.textColor = kNavBarBackgroundColor;
        label.text = @"法律申明及隐私权政策";
        return label;
    } else {
        WLKTCourseDetailSectionHeaderView * view = [[WLKTCourseDetailSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 16, 40) text:@[@"提示条款", @"定义", @"权利声明", @"隐私权政策"][section - 1]];
        return view;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 80;
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 0;
    } else {
        CGSize size = [self.dataSource[indexPath.section] sizeForFont:[UIFont systemFontOfSize:14] size:CGSizeMake(kScreenWidth - 16, 10000) mode:NSLineBreakByWordWrapping];
        if (indexPath.section == 4) {
            return size.height + 150;
        }
        return size.height + 10;
    }
}

#pragma mark - Setters & Getters

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [@[ @"",
                          @"  未来课堂提醒您：在使用未来课堂平台各项服务前，请您务必仔细阅读并透彻理解本声明。如对本声明内容有任何疑问，您可向未来课堂平台客服咨询。阅读本声明的过程中，如果您不同意本声明或其中任何内容，您应立即停止使用未来课堂平台服务。如果您使用未来课堂平台服务的，您的使用行为将被视为对本声明全部内容的认可。" ,
                          @"  未来课堂平台：指未来课堂（域名为shengxue.org）网站及客户端。\n  未来课堂：未来课堂平台经营者的单称或合称，包括未来课堂网经营者成都南博教育咨询有限公司。",
                          @"  一、权利归属\n  除非未来课堂另行声明，未来课堂平台内的所有产品、技术、软件、程序、数据及其他信息（包括但不限于文字、图像、图片、照片、音频、视频、图表、色彩、版面设计、电子文档）的所有权利（包括但不限于版权、商标权、专利权、商业秘密及其他所有相关权利）均归未来课堂或其关联公司所有。未经未来课堂许可，任何人不得擅自使用（包括但不限于通过任何机器人、蜘蛛等程序或设备监视、复制、传播、展示、镜像、上传、下载未来课堂平台内的任何内容）。\n  未来课堂平台的Logo、“未来课堂”、“Future Classroom”等文字、图形及其组合，以及未来课堂平台的其他标识、徵记、产品和服务名称均为未来课堂及其关联公司在中国和其它国家的商标，未经未来课堂书面授权，任何人不得以任何方式展示、使用或作其他处理，也不得向他人表明您有权展示、使用或作其他处理。\n  二、责任限制\n鉴于未来课堂平台提供的服务属于电子公告牌（BBS）性质，未来课堂平台上的培训学校、中职院校、课程信息（包括但不限于课程名称、学校名称、联系人及联络信息、课程的描述和说明、相关图片、视频等）均由会员自行提供并上传，由会员对其提供并上传的所有信息承担相应法律责任。\n   未来课堂平台转载作品（包括论坛内容）出于传递更多信息之目的，并不意味未来课堂赞同其观点或已经证实其内容的真实性。\n  三、知识产权保护\n未来课堂尊重知识产权，反对侵权盗版行为。知识产权权利人认为未来课堂平台内容（包括但不限于未来课堂平台会员发布的商品信息）可能涉嫌侵犯其合法权益，可以通过拨打热线：028-65777077提出通知，未来课堂收到后将及时处理。",
                          @"  未来课堂（下称“我们”）非常尊重用户个人信息的保护，在您使用未来课堂平台提供的服务时，我们将按照本隐私权政策收集、使用及共享您的个人信息。本隐私权政策包含了我们收集、存储、使用、共享和保护您的个人信息的条款，我们希望通过本隐私权政策向您清晰地介绍我们对您个人信息的处理方式，因此我们建议您完整地阅读本隐私权政策，以帮助您了解维护自己隐私权的方式。如您对本隐私权政策有任何疑问，您可以通过未来课堂平台公布的联系方式与我们联系。如果您不同意本隐私权政策任何内容，您应立即停止使用未来课堂平台服务。当您使用未来课堂平台提供的任一服务时，即表示您已同意我们按照本隐私权政策来合法使用和保护您的个人信息。\n  一、适用范围\n  为用户提供更好、更优、更个性化的服务是未来课堂坚持不懈的追求，也希望通过我们提供的服务可以更方便您的生活。本隐私权政策适用于未来课堂平台提供的所有服务，您访问未来课堂平台网站及/或登陆相关客户端使用未来课堂平台提供的服务，均适用本隐私权政策。\n  需要特别说明的是，本隐私权政策不适用于其他第三方向您提供的服务，例如未来课堂上的学校依托未来课堂平台向您提供服务时，您向学校提供的个人信息不适用于本隐私权政策。\n  二、我们如何收集信息\n  我们收集信息是为了向您提供更好、更优、更个性化的服务，我们收集信息的方式如下：\n  1.您向我们提供的信息。 当您注册未来课堂账户及您在使用未来课堂平台提供的相关服务时填写及/或提交的信息，包括您的姓名、性别、出生年月日、身份证号码、护照姓、护照名、护照号码、电话号码、电子邮箱、地址、支付宝账号及相关附加信息（如您所在的省份和城市、邮政编码等）。\n  2.在您使用服务过程中收集的信息。 为了提供并优化您需要的服务，我们会收集您使用服务的相关信息，这类信息包括：\n  在您使用未来课堂平台服务，或访问未来课堂平台网页时，我们自动接收并记录的您的浏览器和计算机上的信息，包括但不限于您的IP地址、浏览器的类型、使用的语言、访问日期和时间、软硬件特征信息及您需求的网页记录等数据；如您下载或使用未来课堂或其关联公司客户端软件，或访问移动网页使用未来课堂平台服务时，未来课堂可能会读取与您位置和移动设备相关的信息，包括但不限于设备型号、设备识别码、操作系统、分辨率、电信运营商等。\n  除上述信息外，我们还可能为了提供服务及改进服务质量的合理需要而收集您的其他信息，包括您与我们的客户服务团队联系时您提供的相关信息，您参与问卷调查时向我们发送的问卷答复信息，以及您与未来课堂的关联方、未来课堂合作伙伴之间互动时我们收集的相关信息。与此同时，为提高您使用未来课堂平台提供的服务的安全性，更准确地预防钓鱼网站欺诈和木马病毒，我们可能会通过了解一些您的网络使用习惯、您常用的软件信息等手段来判断您账户的风险，并可能会记录一些我们认为有风险的URL。\n  3.来自第三方的信息为了给您提供更好、更优、更加个性化的服务，或共同为您提供服务，或为了预防互联网欺诈的目的，未来课堂的关联方、合作伙伴会依据法律的规定或与您的约定或征得您同意的前提下，向未来课堂分享您的个人信息。\n  您了解并同意，以下信息不适用本隐私权政策：\n  a）您在使用未来课堂平台提供的搜索服务时输入的关键字信息；\n  b）在您未选择“匿名购买”和/或“匿名评价”功能时，未来课堂收集到的您在未来课堂平台进行交易的有关数据，包括但不限于出价、成交信息及评价详情；\n  c）信用评价、违反法律规定或未来课堂规则行为及未来课堂已对您采取的措施；\n  d）应法律法规要求需公示的企业名称等相关工商注册信息以及自然人经营者的信息。\n  三、我们如何使用信息\n  因收集您的信息是为了向您提供服务及提升服务质量的目的，为了实现这一目的，我们会把您的信息用于下列用途：\n  1.向您提供您使用的各项服务，并维护、改进这些服务。\n  2.向您推荐您可能感兴趣的内容，包括但不限于向您发出产品和服务信息，或通过系统向您展示个性化的第三方推广信息，或者在征得您同意的情况下与未来课堂的合作伙伴共享信息以便他们向您发送有关其产品和服务的信息。如您不希望接收上述信息，可通过相应的退订功能进行退订。\n  3.我们可能使用您的个人信息以预防、发现、调查欺诈、危害安全、非法或违反与我们或其关联方协议、政策或规则的行为，以保护您、其他我们用户，或我们或其关联方的合法权益。\n  4.我们可能会将来自某项服务的个人信息与来自其他服务的信息结合起来，用于为了给您提供更加个性化的服务使用，例如让您拥有更广泛的社交圈的需要而使用、共享或披露。\n  5.经您许可的其他用途。\n  四、我们如何共享信息\n  我们对您的信息承担保密义务，不会为满足第三方的营销目的而向其出售或出租您的任何信息，我们会在下列情况下才将您的信息与第三方共享：\n  1.事先获得您的同意或授权。\n  2.根据法律法规的规定或行政或司法机构的要求。\n  3.向未来课堂的关联方分享您的个人信息。\n  4.向可信赖的合作伙伴提供您的个人信息，让他们根据我们的指示并遵循我们的隐私权政策以及其他任何相应的保密和安全措施来为我们处理这些信息。\n  5.如您是适格的知识产权投诉人并已提起投诉，应被投诉人要求，向被投诉人披露，以便双方处理可能的权利纠纷。\n  6.只有共享您的信息，才能提供您需要的服务，或处理您与他人的纠纷或争议。例如您在未来课堂上创建的某一交易中，如交易任何一方履行或部分履行了交易义务并提出信息披露请求的，未来课堂会视情况向该用户提供其交易对方的联络方式等必要信息，以促成交易的完成或纠纷的解决。\n  7.如您出现违反中国有关法律、法规或者未来课堂相关协议或相关规则的情况，需要向第三方披露。\n  8.为维护未来课堂及其关联方或用户的合法权益。\n  五、信息存储\n  未来课堂收集的有关您的信息和资料将保存在未来课堂及（或）其关联公司的服务器上，这些信息和资料可能传送至您所在国家、地区或未来课堂收集信息和资料所在地并在该地被访问、存储和展示。\n  六、未成年人保护\n  我们重视未成年人的个人信息保护，如您为未成年人，建议您请您的监护人仔细阅读本隐私权政策，并在征得您的监护人同意的前提下使用我们的服务或向我们提供信息。"] mutableCopy];
    }
    return _dataSource;
}

@end
