<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=request.getParameter("khbh");

String yhmc=(String)session.getAttribute("yhmc");
String zdyhbz=(String)session.getAttribute("zdyhbz");

String ssfgs=null;
String dqbm=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String zxdm="";
String khxm="";
String xb="";
String cqbm="";
String rddqbm="";
String hxwzbm="";
String fwdz="";
String lxfs="";
String sjs="";

String cxhdbm="";
String nlqjbm="";
String zybm="";
String ysrbm="";
String fjfwbm="";
String xqbm="";
String khlxbm="";
String hxbm="";
String fwmj="";
String fgyqbm="";
String bjjb="";
String ywy="";
String hdbz="";
String cgdz="";
String hdr="";
String jzbz="";
String louhao="";
String shbz="";
double lrsjts=0;


double wdzgce=0;
double qye=0;
double glf=0;
double glfbfb=0;
double zqguanlif=0;
double guanlif=0;
double suijinbfb=0;
double suijin=0;

double zqwjrqyexm=0;
double zhwjrqyexm=0;
String wjrqyexmsm="";

double zjxzkl=0;
double spzkl=0;
String sfpzqtyh="";
String pzqtyhnr="";

String hth="";
String sfjczjz="";
String zklx="";
String cxhdbmxq=null;
String cxhdbmzh=null;
String qtdh=null;
String email=null;
String ysshbz="";


String dzbjjc="";//1：人工录入[折扣率、工程费－折前]，根据[折扣率、工程费－折前]自动计算[签约额]；2：人工录入[签约额、工程费－折前]，根据[签约额、工程费－折前]自动计算[折扣率] ；3：全部人工录入[折扣率、签约额、工程费－折前]，不自动计算4：必须做电子报价，[工程费－折前]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改，5：必须做电子报价，[工程费－折前]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]
String zxkhlrjc="";//签单登记中，[咨询录入时间]和[签单录入时间]允许相差最小天数
int zxkhlrts=0;//咨询客户提前录入天数

String shdzbjjc="";//1：人工录入[折扣率、工程费－折前]，根据[折扣率、工程费－折前]自动计算[签约额]；2：人工录入[签约额、工程费－折前]，根据[签约额、工程费－折前]自动计算[折扣率] ；3：全部人工录入[折扣率、签约额、工程费－折前]，不自动计算4：必须做电子报价，[工程费－折前]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改，5：必须做电子报价，[工程费－折前]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]
String shzxkhlrjc="";//签单登记中，[咨询录入时间]和[签单录入时间]允许相差最小天数

double sjjryjbfb=0;
double sjf=0;
double sssjf=0;


String lfbz=null;
String ctbz=null;

double zqqyze=0;
double zhqyze=0;



try {
	conn=cf.getConnection();


	ls_sql="select ysshbz,sjf,qtdh,email,cxhdbmxq,cxhdbmzh,dzbjjc,zxkhlrjc,zklx,sfjczjz,spzkl,zjxzkl,sfpzqtyh,pzqtyhnr,cxhdbm,shbz,SYSDATE-lrsj lrsjts,louhao,rddqbm,hxwzbm,ysrbm,zxdm,jzbz,ywy,khxm,xb,cqbm,fwdz,lxfs,sjs,nlqjbm,zybm,fjfwbm,xqbm,khlxbm,hxbm,fwmj,fgyqbm,bjjb,hdbz,cgdz,hdr,ssfgs";
	ls_sql+=" ,lfbz,ctbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lfbz=cf.fillNull(rs.getString("lfbz"));
		ctbz=cf.fillNull(rs.getString("ctbz"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		sssjf=rs.getDouble("sjf");
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		shdzbjjc=cf.fillNull(rs.getString("dzbjjc"));//启用电子报价检查
		shzxkhlrjc=cf.fillNull(rs.getString("zxkhlrjc"));//启用咨询客户录入检查

		zklx=cf.fillNull(rs.getString("zklx"));
		sfjczjz=cf.fillNull(rs.getString("sfjczjz"));
		spzkl=rs.getDouble("spzkl");
		zjxzkl=rs.getDouble("zjxzkl");
		sfpzqtyh=cf.fillNull(rs.getString("sfpzqtyh"));
		pzqtyhnr=cf.fillNull(rs.getString("pzqtyhnr"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		shbz=cf.fillNull(rs.getString("shbz"));
		lrsjts=rs.getDouble("lrsjts");
		louhao=cf.fillNull(rs.getString("louhao"));
		rddqbm=cf.fillNull(rs.getString("rddqbm"));
		hxwzbm=cf.fillNull(rs.getString("hxwzbm"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		ywy=cf.fillNull(rs.getString("ywy"));
		khxm=rs.getString("khxm");
		xb=cf.fillNull(rs.getString("xb"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		fwdz=rs.getString("fwdz");
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fjfwbm=cf.fillNull(rs.getString("fjfwbm"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		khlxbm=rs.getString("khlxbm");
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=rs.getString("fwmj");
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	if (louhao.equals(""))
	{
		out.println("错误！【楼号】为空，请在咨询客户中修改");
		return;
	}

	if (khxm.indexOf("先生")>0 || khxm.indexOf("小姐")>0 || khxm.indexOf("女士")>0 || khxm.indexOf("阿姨")>0 || khxm.indexOf("叔叔")>0)
	{
		out.println("<BR>错误！[姓名]请输入全称，如：张先生、张小姐、张女士等都不规范");
		return;
	}

	if (cf.isHanzi(khxm)!=2 && cf.isHanzi(khxm)!=4)//0:非汉字无空格；1:非汉字有空格；2：全汉字无空格；3：全汉字有空格；4：包含汉字无空格；5：包含汉字有空格
	{
		out.println("<BR>错误，请输入正确的[姓名]，中间不允许包含空格");
		return;
	}
	if (cf.isHanzi(fwdz)!=2 && cf.isHanzi(fwdz)!=4)//0:非汉字无空格；1:非汉字有空格；2：全汉字无空格；3：全汉字有空格；4：包含汉字无空格；5：包含汉字有空格
	{
		out.println("<BR>错误，请输入正确的[房屋地址]，中间不允许包含空格");
		return;
	}
/*
	if (!lfbz.equals("Y"))//lf
	{
		out.println("错误！未量房，不能做签单登记");
		return;
	}
	if (!ctbz.equals("Y"))
	{
		out.println("错误！未出图，不能做签单登记");
		return;
	}

	if (ysshbz.equals("M"))//N：未审核；Y：审核通过；M：审核未通过
	{
		out.println("错误！预算审核未通过，不能做签单登记");
		return;
	}
*/
	if (spzkl==0)//合同折扣率
	{
		spzkl=10;
	}
	if (zjxzkl==0)//增减项折扣率
	{
		zjxzkl=10;
	}

	if (sfpzqtyh.equals(""))//是否批准其它优惠
	{
		sfpzqtyh="N";
	}

	//对促销活动做检查＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	if (!cxhdbm.equals(""))
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from jc_cxhd,jc_cxhdsj";
		ls_sql+=" where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.fgsbh='"+ssfgs+"'";
		ls_sql+=" and jc_cxhd.jsbz='N' and jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.qdjssj>=TRUNC(SYSDATE)";
		ls_sql+=" and jc_cxhd.hdlx in('1','2') and jc_cxhd.cxhdmc='"+cxhdbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("<BR>公司促销活动『"+cxhdbm+"』已过期，请在咨询信息中重新选择");
			return;
		}
	}

	if (!cxhdbmxq.equals(""))
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from jc_cxhd,jc_cxhdsj";
		ls_sql+=" where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.fgsbh='"+ssfgs+"'";
		ls_sql+=" and jc_cxhd.jsbz='N' and jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.qdjssj>=TRUNC(SYSDATE)";
		ls_sql+=" and jc_cxhd.hdlx in('3') and jc_cxhd.cxhdmc='"+cxhdbmxq+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("<BR>小区促销活动『"+cxhdbmxq+"』已过期，请在咨询信息中重新选择");
			return;
		}
	}

	if (!cxhdbmzh.equals(""))
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from jc_cxhd,jc_cxhdsj";
		ls_sql+=" where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.fgsbh='"+ssfgs+"'";
		ls_sql+=" and jc_cxhd.jsbz='N' and jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.qdjssj>=TRUNC(SYSDATE)";
		ls_sql+=" and jc_cxhd.hdlx in('4') and jc_cxhd.cxhdmc='"+cxhdbmzh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("<BR>展会促销活动『"+cxhdbmzh+"』已过期，请在咨询信息中重新选择");
			return;
		}
	}

	//对促销活动做检查=============================结束


	ls_sql="SELECT dqbm,dzbjjc,zxkhlrjc,zxkhlrts,sjjryjbfb";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		dzbjjc=cf.fillNull(rs.getString("dzbjjc"));//启用电子报价检查
		zxkhlrjc=cf.fillNull(rs.getString("zxkhlrjc"));//启用咨询客户录入检查
		zxkhlrts=rs.getInt("zxkhlrts");//咨询客户提前录入天数

		sjjryjbfb=rs.getDouble("sjjryjbfb");//设计客户计入业绩收款比例 

	}
	rs.close();
	ps.close();

	if (shbz.equals("Y"))//信息审核标志
	{
		dzbjjc=shdzbjjc;
		zxkhlrjc=shzxkhlrjc;
	}

	
	//取电子报价数据＋＋＋＋＋＋＋＋＋开始

	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	dzbj.updateSfxm(conn,khbh,"yz");

	wdzgce=dzbj.getBjje(conn,khbh,"yz");//获取『折前』电子报价金额，直接费＋其它收费，不包括【不记入签约额】项目
	qye=dzbj.getZhBjje(conn,khbh,"sxyd");//获取『折后』电子报价金额，直接费＋其它收费，不包括【不记入签约额】项目

	suijinbfb=dzbj.getSuijinBfb(conn,khbh,"yz");//税金百分比
	suijin=dzbj.getZhSuijinJe(conn,khbh,"yz");//获取折后『税金金额』

	glfbfb=dzbj.getGlfBl(conn,khbh,"yz");//管理费百分比
	zqguanlif=dzbj.getZqGlfJe(conn,khbh,"yz");//『折前』管理费
	guanlif=dzbj.getZhGlfJe(conn,khbh,"yz");//获取折后『管理费金额』

	zqwjrqyexm=dzbj.getZqWjrJe(conn,khbh,"yz");//获取折前『其它收费项目金额』，不包括税金、管理费、设计费
	zhwjrqyexm=dzbj.getZhWjrJe(conn,khbh,"yz");//获取折后『其它收费项目金额』，不包括税金、管理费、设计费
	wjrqyexmsm=dzbj.getWjrJeMc(conn,khbh,"yz");//获取『其它收费项目名称』，不包括税金、管理费、设计费

	sjf=dzbj.getZhSjf(conn,khbh,"yz");//获取折后『设计费』

	//取电子报价数据===============结束

	zqqyze=wdzgce+zqguanlif+suijin+zqwjrqyexm;
	zqqyze=cf.round(zqqyze,2);
	zhqyze=qye+guanlif+suijin+zhwjrqyexm;
	zhqyze=cf.round(zhqyze,2);


	//4:必须做电子报价，[工程直接费－折前]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改
	//5:必须做电子报价，[工程直接费－折前]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]
	if (dzbjjc.equals("4") || dzbjjc.equals("5"))
	{
		if (wdzgce<=0)
		{
			out.println("<BR>错误！不做电子报价，不能进行签单登记！");
			return;
		}

/*
		//输入:  lx 9：检查全部；1：检查单价；2：检查名称；3：检查工艺材料简介；4：检查报价级别；5：检查必选项目；6：检查不存在项目
		String retStr=dzbj.checkBjjb(conn,khbh,9);
		if (!retStr.equals("0"))
		{
			out.println(retStr);
			out.println("<P>客户电子报价检查错误");
//			return;
		}

		int bxx=dzbj.getBxxm(conn,khbh,"yz");
		if (bxx!=9999)
		{
			%>
			<SCRIPT language=javascript >
			<!--
			alert("提醒！税金等必选项目没有选择：<%=bxx%>");
			//-->
			</SCRIPT>
			<%
			//return;//lf需要
		}
*/
	}

	//启用咨询客户录入检查
	if (zxkhlrjc.equals("Y") && !shbz.equals("Y"))//N：不启用；Y：启用
	{
		if (lrsjts<zxkhlrts )
		{
			out.println("错误！该客户资料是["+lrsjts+"]天前录入，必须提前["+zxkhlrts+"]天录入，否则只能经过审核，才能签单登记！");
			return;
		}
	}

	

	//取合同号
	String year=cf.today("YY")+cf.today("MM");
//	String year=cf.today("YY");//HG

	ls_sql="select hth";
	ls_sql+=" from  crm_hthxx";
//	ls_sql+=" where dwbh='"+zxdm+"' and sybz='N' and substr(hth,4,4)='"+year+"'";//Y：已使用；N：未使用
	ls_sql+=" where dwbh='"+zxdm+"' and sybz='N' and substr(hth,1,4)='"+year+"'";//Y：已使用；N：未使用，YZF
//	ls_sql+=" where dwbh='"+zxdm+"' and sybz='N' and substr(hth,11,2)='"+year+"'";//Y：已使用；N：未使用,HG
	ls_sql+=" order by hth";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=rs.getString(1);
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body bgcolor="#CCCCFF"  style="FONT-SIZE:14">

<form method="post" action="" name="insertform" target='_blank'>
          
  <div align="center"> 
    <p>请录入客户信息（<font color="#FF0033">*</font>为必填字段）（客户编号：<%=khbh%>）</p>
    <p><strong><font color="#FF0000">注意：系统更新说明如下：</font></strong></p>
    <p><font color="#FF0000"><strong>1、工程签约额现变更为三部分：工程直接费、管理费、税金，即：工程签约额=工程直接费+管理费+税金</strong></font></p>
    <p><strong><font color="#FF0000">2、工程减免额、管理费减免额、税金减免额：用于抹零使用，如：工程直接费=10000.36，工程减免额=0.36，抹零后工程直接费=10000</font></strong></p>
    <p><strong><font color="#FF0000">3、书面合同编号：填写财务领取的空白合同编号</font></strong></p>
    <p><strong><font color="#FF0000">4、对店面业绩没有影响，大家不用担心，新的业绩=工程直接费+管理费+税金</font></strong></p>
    <p><strong><font color="#FF0000">5、工程直接费不含管理费、税金</font></strong></p>
  </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>合同号</td>
      <td width="34%"> 
        <input type="text" name="hth" value="<%=hth%>" size="20" maxlength="20" onKeyUp="keyGo(smhtbh)">
      </td>
      <td width="19%" align="right">书面合同编号</td>
      <td width="31%"><input type="text" name="smhtbh" value="" size="20" maxlength="20" onKeyUp="keyTo(khlxbm)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000FF">客户姓名</font>      </td>
      <td width="34%"> 
        <input type="hidden" name="khbh" value="<%=khbh%>" >
        <input type="text" name="khxm" value="<%=khxm%>" size="20" maxlength="50" readonly>
      </td>
      <td width="19%" align="right"> 
        <font color="#FF0033">*</font>性别      </td>
      <td width="31%"> 
        <input type="radio" name="xb"  value="M" <% if (xb.equals("M")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        男 
        <input type="radio" name="xb"  value="W" <% if (xb.equals("W")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        女 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>手机</td>
      <td colspan="3"> 
        <input type="text" name="lxfs" value="<%=lxfs%>" size="40" maxlength="50">
        <font color="#FF0000">用于接收短信，最好录一部,有多个电话<font color="#0000FF">用英文逗号</font>分隔</font></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">其它电话</td>
      <td colspan="3"> 
        <input type="text" name="qtdh" value="<%=qtdh%>" size="40" maxlength="50">
        <font color="#FF0000">(注意：有多个电话<font color="#0000FF">用英文逗号</font>分隔)</font> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">电子邮件</td>
      <td width="34%"> 
        <input type="text" name="email" value="<%=email%>" size="30" maxlength="50">
      </td>
      <td width="19%" align="right">业主身份证号码</td>
      <td width="31%"> 
        <input type="text" name="sfzhm" value="" size="20" maxlength="18" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" bgcolor="#FFFFFF"> 
        <font color="#FF0033">*</font><font color="#0000FF">房屋地址</font>      </td>
      <td colspan="3"> 
		<input type="hidden" name="cqbm" value="<%=cqbm%>" >
		<input type="hidden" name="xqbm" value="<%=xqbm%>" >
		<input type="hidden" name="louhao" value="<%=louhao%>">
        <input type="text" name="fwdz" value="<%=fwdz%>" size="76" maxlength="100" readonly>
      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">所属热点地区</td>
      <td width="34%"> 
        <select name="rddqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(hxwzbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where dqbm='"+dqbm+"' order by rddqbm",rddqbm);
%> 
        </select>
      </td>
      <td width="19%" align="right">所属环线位置</td>
      <td width="31%"> 
        <select name="hxwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(nlqjbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hxwzbm,hxwz from dm_hxwzbm where dqbm='"+dqbm+"' order by hxwzbm",hxwzbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">年龄区间</td>
      <td width="34%"> 
        <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(zybm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm);
%> 
        </select>
      </td>
      <td width="19%" align="right">职业</td>
      <td width="31%"> 
        <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(ysrbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">月收入</td>
      <td width="34%"> 
        <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(fjfwbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm",ysrbm);
%> 
        </select>
      </td>
      <td width="19%" align="right">房价</td>
      <td width="31%"> 
        <select name="fjfwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fjfwbm,fjfwmc from dm_fjfwbm order by fjfwbm",fjfwbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000FF">设计师</font>      </td>
      <td width="34%"> 
        <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" readonly>
      </td>
      <td width="19%" align="right"> 
        <font color="#0000FF">业务员</font>      </td>
      <td width="31%"> 
        <input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="20" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font>房屋面积      </td>
      <td width="34%"> 
        <input type="text" name="fwmj" value="<%=fwmj%>" size="20" maxlength="20"  onChange="calValue(insertform)" onKeyUp="keyGo(bjjb[0])">
        <input type="hidden" name="pmjj" value="" >
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>报价级别</td>
      <td width="31%"><%
	if (bjjb.equals(""))
	{
		cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","bjjb","");
	}
	else 
	{
		cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjb+"'","bjjb",bjjb);
	}

%></td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <%
	if (dzbjjc.equals("1"))//1：人工录入[折扣率、工程直接费－折前]，根据[折扣率、工程直接费－折前]自动计算[签约额]
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">签约总额－折前</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">签约总额－折后</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否有优惠</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+是&N+否",sfpzqtyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">优惠内容</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=pzqtyhnr%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>合同折扣</td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=spzkl%>" onChange="calValue(insertform)" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0033">*</font>增减项折扣</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>工程直接费原报价</td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" onChange="calValue(insertform)" >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>工程直接费减免额</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="0" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费签约额</font></td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>管理费百分比</td>
      <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" onChange="calValue(insertform)">
% </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">折前－管理费</font></td>
      <td width="34%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">折后－管理费</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font>税金百分比</td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" onChange="calValue(insertform)" >
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金</font></td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>管理费减免额</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>税金减免额</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>其它收费－折前</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">其它收费－折后</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">其它收费项目</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("2"))//2：人工录入[签约额、工程直接费－折前]，根据[签约额、工程直接费－折前]自动计算[折扣率]
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">签约总额－折前</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">签约总额－折后</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否有优惠</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+是&N+否",sfpzqtyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">优惠内容</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=pzqtyhnr%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">合同折扣</font></td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=spzkl%>" readonly>
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0033">*</font>增减项折扣</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>工程直接费－折前</td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" onChange="calValue(insertform)" >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>工程减免额</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="0" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>工程直接费－折后</td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>管理费百分比</td>
      <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" onChange="calValue(insertform)">
% </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">折前－管理费</font></td>
      <td width="34%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly>      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">折后管－理费</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font>税金百分比</td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" onChange="calValue(insertform)" >
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金</font></td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>管理费减免额</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>税金减免额</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>其它收费－折前</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">其它收费－折后</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">其它收费项目</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("3"))//3：全部人工录入[折扣率、签约额、工程直接费－折前]，不自动计算
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">签约总额－折前</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">签约总额－折后</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否有优惠</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+是&N+否",sfpzqtyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">优惠内容</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=pzqtyhnr%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>合同折扣</td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=spzkl%>" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0033">*</font>增减项折扣</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>工程直接费－折前</td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%"><input type="hidden" name="cdzwjmje" value="0" size="20" maxlength="16"  >
      <input name="glfjmje2" type="hidden"  value="0" size="20" maxlength="16" >
      <input name="sjjmje2" type="hidden"  value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>工程直接费－折后</td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>管理费百分比</td>
      <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16">
% </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>折前－管理费</td>
      <td width="34%">
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>折后－管理费</td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font>税金百分比</td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" >
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>税金</td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>其它收费－折前</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font>其它收费－折后</td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">其它收费项目</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("6"))//6:全部人工录入[折扣率、签约额、合同原报价]，自动计算减免
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">签约总额－折前</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">签约总额－折后</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否有优惠</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+是&N+否",sfpzqtyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">优惠内容</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=pzqtyhnr%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>合同折扣</td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=spzkl%>" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0033">*</font>增减项折扣</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>工程直接费－折前</td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>工程减免额</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="0" size="20" maxlength="16"  ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>工程直接费－折后</td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>管理费百分比</td>
      <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16">
% </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>折前－管理费</td>
      <td width="34%">
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>折后－管理费</td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font>税金百分比</td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" >
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>税金</td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>管理费减免额</td>
      <td><input name="glfjmje" type="text"  value="0" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>税金减免额</td>
      <td><input name="sjjmje" type="text"  value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>其它收费－折前</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font>其它收费－折后</td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">其它收费项目</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("4"))//4：必须做电子报价，[工程直接费－折前]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">签约总额－折前</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">签约总额－折后</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">是否有优惠</font></td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+是&N+否",sfpzqtyh,true);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">优惠内容</font></td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=pzqtyhnr%>" size="76" maxlength="200" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">合同折扣</font></td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=spzkl%>" readonly>
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">增减项折扣</font></td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>" readonly>
      <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折前</font></td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>工程减免额</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="0" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折后</font></td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费百分比</font></td>
      <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" readonly>
% </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折前</font></td>
      <td width="34%"> 
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折后</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金百分比</font></td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金</font></td>
      <td width="31%"> 
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>管理费减免额</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>税金减免额</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">其它收费－折前</font></td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">其它收费－折后</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">其它收费项目</font></td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" readonly ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("7"))//7：必须做电子报价，[合同原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改，可修改其它优惠
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">签约总额－折前</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">签约总额－折后</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否有优惠</td>
      <td width="34%">
		<%
			cf.radioToken(out, "sfyyh","Y+是&N+否",sfpzqtyh);
		%>	  </td> 
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">优惠内容</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=pzqtyhnr%>" size="76" maxlength="200"  >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">合同折扣</font></td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=spzkl%>" readonly>
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">增减项折扣</font></td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>" readonly>
      <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折前</font></td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>工程减免额</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="0" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折后</font></td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费百分比</font></td>
      <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" readonly>
% </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折前</font></td>
      <td width="34%"> 
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折后</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金百分比</font></td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金</font></td>
      <td width="31%"> 
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>管理费减免额</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>税金减免额</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">其它收费－折前</font></td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">其它收费－折后</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">其它收费项目</font></td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" readonly ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("5"))//5：必须做电子报价，[工程直接费－折前]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">签约总额－折前</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">签约总额－折后</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否有优惠</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+是&N+否",sfpzqtyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">优惠内容</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=pzqtyhnr%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>合同折扣</td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=spzkl%>" onChange="calValue(insertform)" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0033">*</font>增减项折扣</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折前</font></td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>工程减免额</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="0" size="20" maxlength="16" onChange="calValue(insertform)" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折后</font></td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费百分比</font></td>
      <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" readonly>
% </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">折前－管理费</font></td>
      <td width="34%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly>      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">折后－管理费</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金百分比</font></td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金</font></td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>管理费减免额</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>税金减免额</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">其它收费－折前</font></td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">其它收费－折后</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">其它收费项目</font></td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" readonly ></td>
    </tr>
    <%
	}
	else{
		out.println("『启用电子报价检查』错误！"+dzbjjc);
		return;
	}
%> 
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>设计费</td>
      <td width="34%"> 
        <input type="text" name="sjf" value="<%=sjf%>" size="20" maxlength="16"  onKeyUp="keyGo(glf)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>服务费</td>
      <td width="31%"> 
        <input type="text" name="glf" value="<%=glf%>" size="20" maxlength="16" onKeyUp="keyGo(sffj[0])">
        <input type="hidden" name="hbqye" value="0" size="20" maxlength="16" onKeyUp="keyGo(sffj[0])">      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
   <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否返券</td>
      <td width="34%"> 
        <input type="radio" name="sffj"  value="Y" onKeyUp="keyGo(fjje)">
        是 
        <input type="radio" name="sffj"  value="N" onKeyUp="keyGo(sfyrz[0])">
        否 </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">返券总金额</td>
      <td width="34%"> 
        <input type="text" name="fjje" value="" size="20" maxlength="20" onKeyUp="keyGo(gsfje)">
      </td>
      <td width="19%" align="right">公司承担返卷额</td>
      <td width="31%"> 
        <input type="text" name="gsfje" value="" size="20" maxlength="20" onKeyUp="keyGo(sfyrz[0])">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否已认证</td>
      <td width="34%"> 
        <input type="radio" name="sfyrz"  value="Y" onKeyUp="keyGo(sfyyh[0])">
        是 
        <input type="radio" name="sfyrz"  value="N" onKeyUp="keyGo(sfyyh[0])">
        否 </td>
      <td width="19%" align="right">认证市场</td>
      <td width="31%"> 
        <select name="rzsc" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' and cxbz='N' order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">参加公司促销活动</font></td>
      <td colspan="3"> 
        <input type="text" name="cxhdbm" value="<%=cxhdbm%>" size="76" maxlength="50" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">参加小区促销活动</font></td>
      <td colspan="3"> 
        <input type="text" name="cxhdbmxq" value="<%=cxhdbmxq%>" size="76" maxlength="50" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">参加展会促销活动</font></td>
      <td colspan="3"> 
        <input type="text" name="cxhdbmzh" value="<%=cxhdbmzh%>" size="76" maxlength="50" readonly>
      </td>
    </tr>
  </TABLE>



<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>家装标志</td>
      <td width="34%"><%
	cf.radioToken(out, "jzbz","1+家装&2+公装",jzbz);
%></td>
      <td rowspan="5" align="right" width="19%"><font color="#FF0033">*</font>信息来源 
      </td>
      <td rowspan="5" width="31%"> 
        <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(jyjdrq)" size="8" multiple>
          <%
	cf.mutilSelectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","select xxlybm from crm_khxxly where khlx='2' and khbh='"+khbh+"'");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>户型</td>
      <td width="34%"> 
        <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(fgflbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>风格</td>
      <td width="34%"> 
        <select name="fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(ysbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgyqbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>油色</td>
      <td width="34%"> 
        <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(czbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">材质</td>
      <td width="34%"> 
        <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(xxlybm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select czbm,czmc from dm_czbm order by czbm","");
%> 
        </select>
      </td>
    </tr>
  </TABLE>



<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">开工时间</td>
      <td width="34%"> 
        <input type="radio" name="kgsjqd" value="Y" checked>
        已确定 
        <input type="radio" name="kgsjqd" value="N">
        未确定</td>
      <td width="19%" align="right"><font color="#FF0033">*</font>工期天数</td>
      <td width="31%">
      <input type="text" name="gqts" size="20" maxlength="10" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>建议交底日期</td>
      <td width="34%"> 
        <input type="text" name="jyjdrq" value="" size="20" maxlength="10" onKeyUp="keyGo(qyrq)"  ondblclick="JSCalendar(this)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>签约日期</td>
      <td width="31%"> 
        <input type="text" name="qyrq" value="<%=cf.today()%>" size="20" maxlength="10" onKeyUp="keyGo(kgrq)"  ondblclick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>合同开工日期</td>
      <td width="34%"> 
        <input type="text" name="kgrq" value="" size="20" maxlength="10" onKeyUp="keyGo(jgrq)"  ondblclick="JSCalendar(this)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>合同竣工日期</td>
      <td width="31%"> 
        <input type="text" name="jgrq" size="20" maxlength="10" onKeyUp="keyTo(hdbz)"  ondblclick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>回单标志</td>
      <td width="34%"> 
        <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(insertform)" onKeyUp="keyGo(bz)">
          <%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz);
%> 
        </select>      </td>
      <td width="19%" align="right">回单人</td>
      <td width="31%"> 
        <input type="text" name="hdr" value="<%=hdr%>" size="20" maxlength="20"  >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">回单工地队长</td>
      <td><input type="text" name="hdsgd" value="" size="20" maxlength="20"  ></td>
      <td align="right">回单工地班长</td>
      <td><input type="text" name="hdsgbz" value="" size="20" maxlength="20"  ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">回单工地</td>
      <td colspan="3"> 
        <input type="text" name="cgdz" value="<%=cgdz%>" size="76" maxlength="100" onKeyUp="keyGo(bz)" >      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">水质分析卡发放</td>
      <td width="34%"> 
        <input type="radio" name="sffk" value="Y">
        发卡 
        <input name="sffk" type="radio" value="N" checked>
        未发卡 </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>关系客户</td>
      <td width="31%"><select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyGo(khxm)">
        <%
	if (zdyhbz.equals("Y"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm);
	}
	else{
		out.println("<option value=\"04\">普通客户</option>");
	}
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">登记卡号</td>
      <td width="34%"> 
        <input type="text" name="djkh" value="" size="20" maxlength="20" >      </td>
      <td width="19%" align="right">发卡日期</td>
      <td width="31%"> 
        <input type="text" name="fkrq" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000CC">签约店面</font></td>
      <td width="34%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"'","");
%> 
        </select>      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000CC">所属分公司</font></td>
      <td width="31%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000CC">录入时间</font>      </td>
      <td width="34%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)">      </td>
      <td width="19%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000CC">信息录入人</font>     </td>
      <td width="31%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        备注      </td>
      <td colspan="3"> 
        <textarea name="bz" cols="75" rows="2" onKeyUp="keyTo(savebutton)"></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)" name="savebutton">
        <input type="button"  value="电子报价打印预览" onClick="f_ck(insertform)" name="ck" >
        <input type="hidden" name="sfcjq" value="1" >
        <input type="hidden" name="sffby" value="1" >
        <input type="hidden" name="hyklxbm" value="" >
        <input type="hidden" name="hykh" value="" >
        <input type="hidden" name="yxsjs" value="" >
        <input type="hidden" name="yxsjz" value="" >
        <input type="hidden" name="sjsbh" value=""  >
      <input type="hidden" name="dzbjjc" value="<%=dzbjjc%>"></td>
    </tr>
  </table>
</form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function calValue(FormName)
{  
	<%
	if (dzbjjc.equals("1"))//1：人工录入[折扣率、工程原报价]，根据[折扣率、工程原报价]自动计算[签约额]
	{
		%>
		var yqye=FormName.wdzgce.value/10.0*FormName.zkl.value;
		yqye=round(yqye,2);

		var qye=yqye-FormName.cdzwjmje.value;
		qye=round(qye,2);
		FormName.qye.value=qye;


		var zqguanlif=FormName.wdzgce.value*FormName.glfbfb.value/100.0;
		FormName.zqguanlif.value=round(zqguanlif,2);  
		
		var yguanlif=FormName.zkl.value/10.0*FormName.zqguanlif.value;
		yguanlif=round(yguanlif,2);

		var guanlif=yguanlif-FormName.glfjmje.value;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;      


		var suijin=(yqye+yguanlif)*FormName.suijinbfb.value/100.0-FormName.sjjmje.value;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;     

		var zhwjrqyexm=FormName.zkl.value/10.0*FormName.zqwjrqyexm.value;
		FormName.zhwjrqyexm.value=round(zhwjrqyexm,2);      

		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     
		
		<%
	}
	else if (dzbjjc.equals("2"))//2：人工录入[签约额、工程原报价]，根据[签约额、工程原报价]自动计算[折扣率]
	{
		%>
		var yqye=FormName.qye.value*1.0+FormName.cdzwjmje.value*1.0;
		var zkl=yqye*10.0/FormName.wdzgce.value;
		zkl=round(zkl,2);
		FormName.zkl.value=zkl;

		var zqguanlif=FormName.wdzgce.value*FormName.glfbfb.value/100.0;
		FormName.zqguanlif.value=round(zqguanlif,2);  

		var yguanlif=FormName.zkl.value/10.0*FormName.zqguanlif.value;
		yguanlif=round(yguanlif,2);

		var guanlif=yguanlif-FormName.glfjmje.value;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;      

		var suijin=(yqye+yguanlif)*FormName.suijinbfb.value/100.0-FormName.sjjmje.value;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;     

		var zhwjrqyexm=FormName.zkl.value/10.0*FormName.zqwjrqyexm.value;
		FormName.zhwjrqyexm.value=round(zhwjrqyexm,2);      

		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     

		<%
	}
	else if (dzbjjc.equals("3"))//3：全部人工录入[折扣率、签约额、合同原报价]，不自动计算，不记录减免
	{
		%>
		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     
		<%
	}
	else if (dzbjjc.equals("6"))//6：全部人工录入[折扣率、签约额、合同原报价] ，不自动计算，记录减免
	{
		%>
		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     
		<%
	}
	else if (dzbjjc.equals("4"))//4：必须做电子报价，[工程原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改
	{
		%>
		var qye=<%=qye%>-FormName.cdzwjmje.value*1.0;
		qye=round(qye,2);
		FormName.qye.value=qye;

		var guanlif=<%=guanlif%>-FormName.glfjmje.value*1.0;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;

		var suijin=<%=suijin%>-FormName.sjjmje.value*1.0;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;

		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     
		<%
	}
	else if (dzbjjc.equals("7"))//7：必须做电子报价，[合同原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改，可修改其它优惠
	{
		%>
		var qye=<%=qye%>-FormName.cdzwjmje.value*1.0;
		qye=round(qye,2);
		FormName.qye.value=qye;

		var guanlif=<%=guanlif%>-FormName.glfjmje.value*1.0;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;

		var suijin=<%=suijin%>-FormName.sjjmje.value*1.0;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;

		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     
		<%
	}
	else if (dzbjjc.equals("5"))//5：必须做电子报价，[工程原报价]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]
	{
		%>
		var yqye=FormName.wdzgce.value/10.0*FormName.zkl.value;
		yqye=round(yqye,2);

		var qye=yqye-FormName.cdzwjmje.value;
		qye=round(qye,2);
		FormName.qye.value=qye;

		var zqguanlif=FormName.wdzgce.value*FormName.glfbfb.value/100.0;
		FormName.zqguanlif.value=round(zqguanlif,2);  

		var yguanlif=FormName.zkl.value/10.0*FormName.zqguanlif.value;
		yguanlif=round(yguanlif,2);

		var guanlif=yguanlif-FormName.glfjmje.value;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;      

		var suijin=(yqye+yguanlif)*FormName.suijinbfb.value/100.0-FormName.sjjmje.value;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;     

		var zhwjrqyexm=FormName.zkl.value/10.0*FormName.zqwjrqyexm.value;
		FormName.zhwjrqyexm.value=round(zhwjrqyexm,2);      

		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     

		<%
	}
	%>
	
	
	FormName.pmjj.value=parseInt(FormName.qye.value/FormName.fwmj.value);      
}    

function cf_hdbz(FormName){  
	if(FormName.hdbz.value=="1") {//1：非回单； 2：设计师回单；3：施工队回单；4：老客户回单;5：员工回单
		FormName.cgdz.value="";
		FormName.hdr.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
	}
	else {
		FormName.cgdz.disabled=false;
		FormName.hdr.disabled=false;
	}
}      

function f_do(FormName)//参数FormName:Form的名称
{
	calValue(FormName);


	if(	javaTrim(FormName.hth)=="") {
		alert("请输入[合同号]！");
		FormName.hth.focus();
		return false;
	}
	//if(	javaTrim(FormName.smhtbh)=="") {
		//alert("请输入[书面合同编号]！");
		//FormName.smhtbh.focus();
		//return false;
	//}
	<%
	if (bjjb.equals(""))
	{
		%>
		if(	!radioChecked(FormName.bjjb)) {
			alert("请选择[报价级别]！");
			FormName.bjjb[0].focus();
			return false;
		}
		<%
	}
	else 
	{
		%>
		if(!FormName.bjjb.checked) {
			alert("请输入[报价级别]！");
			FormName.bjjb.focus();
			return false;
		}
		<%
	}
	%>

	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("请选择[性别]！");
		FormName.xb[0].focus();
		return false;
	}
	if(FormName.lxfs.value=="" && FormName.qtdh.value=="") {
		alert("请输入[手机]或[其它电话]！");
		FormName.lxfs.focus();
		return false;
	}
	if(!(isMPhone(FormName.lxfs, "手机"))) {
		return false;
	}
	if(!(isPhone(FormName.qtdh, "其它电话"))) {
		return false;
	}
	if(!(isEmail(FormName.email, "电子邮件"))) {
		return false;
	}

	if(	javaTrim(FormName.cqbm)=="") {
		alert("请输入[所属区域]！");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqbm)=="") {
		alert("请输入[小区/街道]！");
		FormName.xqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.louhao)=="") {
		alert("请输入[楼号/门牌号]！");
		FormName.louhao.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
<%
	if (ssfgs.equals("FBJ00"))
	{
		%>
		//if(	javaTrim(FormName.sfzhm)=="") {
			//alert("请输入[身份证号码]！");
			//FormName.sfzhm.focus();
			//return false;
		//}
		//if(!(isSfzhm(FormName.sfzhm, "身份证号码"))) {
			//return false;
		//}
	

		if(	!radioChecked(FormName.sffk)) {
			alert("请选择[水质分析卡是否发放]！");
			FormName.sffk[0].focus();
			return false;
		}
		if (FormName.sffk[0].checked)
		{
			if(	javaTrim(FormName.djkh)=="") {
				alert("请输入[登记卡号]！");
				FormName.djkh.focus();
				return false;
			}
			if(	javaTrim(FormName.fkrq)=="") {
				alert("请输入[发卡日期]！");
				FormName.fkrq.focus();
				return false;
			}
			if(!(isDatetime(FormName.fkrq, "发卡日期"))) {
				return false;
			}
		}
		else{
			FormName.djkh.value="";
			FormName.fkrq.value="";
		}
		<%
	}
%>
	
	if(	javaTrim(FormName.sjs)=="") {
		alert("请输入[设计师]！");
		FormName.sjs.focus();
		return false;
	}
	if(	javaTrim(FormName.khlxbm)=="") {
		alert("请选择[关系客户]！");
		FormName.khlxbm.focus();
		return false;
	}

	if(	!selectChecked(FormName.xxlybm)) {
		alert("请输入[信息来源]！");
		FormName.xxlybm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请输入[户型]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgflbm)=="") {
		alert("请输入[风格分类]！");
		FormName.fgflbm.focus();
		return false;
	}

	if(	javaTrim(FormName.hbqye)=="") {
		alert("请输入[环保项目签约额]！");
		FormName.hbqye.focus();
		return false;
	}
	if(!(isFloat(FormName.hbqye, "环保项目签约额"))) {
		return false;
	}
	if (FormName.sfcjq.value=="2" || FormName.sffby.value=="2")
	{
		if (FormName.hbqye.value=="0")
		{
			alert("请输入[环保项目签约额]！");
			FormName.hbqye.select();
			return false;
		}
	}
	else{
		FormName.hbqye.value="0";
	}

	if(	javaTrim(FormName.ysbm)=="") {
		alert("请输入[油色]！");
		FormName.ysbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwmj)=="") {
		alert("请输入[面积]！");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "面积"))) {
		return false;
	}
	if (parseInt(FormName.fwmj.value)==0)
	{
		alert("[面积]不能为0！");
		FormName.fwmj.select();
		return false;
	}

	if(	!radioChecked(FormName.sfyyh)) {
		alert("请选择[是否有优惠]！");
		FormName.sfyyh[0].focus();
		return false;
	}

	if (FormName.sfyyh[0].checked)
	{
		if(	javaTrim(FormName.yhyy)=="") {
			alert("请输入[优惠内容]！");
			FormName.yhyy.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.yhyy)!="") {
			alert("您选择了无优惠,请删除[优惠内容]！");
			FormName.yhyy.select();
			return false;
		}
	}

	if(	javaTrim(FormName.wdzgce)=="") {
		alert("请输入[工程直接费－折前]！");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "工程直接费－折前"))) {
		return false;
	}
	if (parseFloat(FormName.wdzgce.value)==0)
	{
		alert("[工程直接费－折前]不能为0！");
		FormName.wdzgce.select();
		return false;
	}
	if (parseFloat(FormName.wdzgce.value)<parseFloat(FormName.qye.value))
	{
		alert("[工程直接费－折前]不能小于[工程直接费－折后]！");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("请输入[工程直接费－折后]！");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "工程直接费－折后"))) {
		return false;
	}
	if (parseFloat(FormName.qye.value)==0)
	{
		alert("[工程直接费－折后]不能为0！");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("请输入[合同折扣率]！");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "合同折扣率"))) {
		return false;
	}
	if (FormName.zkl.value<0 || FormName.zkl.value>10)
	{
		alert("错误！[合同折扣率]应该在0和10之间！");
		FormName.zkl.select();
		return false;
	}
	if(	javaTrim(FormName.zjxzkl)=="") {
		alert("请输入[增减项折扣率]！");
		FormName.zjxzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxzkl, "增减项折扣率"))) {
		return false;
	}
	if (FormName.zjxzkl.value<0 || FormName.zjxzkl.value>10)
	{
		alert("错误！[增减项折扣率]应该在0和10之间！");
		FormName.zjxzkl.select();
		return false;
	}


	if(	javaTrim(FormName.cdzwjmje)=="") {
		alert("请输入[工程减免额]！");
		FormName.cdzwjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.cdzwjmje, "工程减免额"))) {
		return false;
	}
/*
	if (FormName.cdzwjmje.value<0 || FormName.cdzwjmje.value>100)
	{
		alert("错误！[工程减免额]应该在0和100之间！");
		FormName.cdzwjmje.select();
		return false;
	}
*/
	if(	javaTrim(FormName.glfjmje)=="") {
		alert("请输入[管理费减免额]！");
		FormName.glfjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.glfjmje, "管理费减免额"))) {
		return false;
	}
/*
	if (FormName.glfjmje.value<0 || FormName.glfjmje.value>100)
	{
		alert("错误！[管理费减免额]应该在0和100之间！");
		FormName.glfjmje.select();
		return false;
	}
*/
	if(	javaTrim(FormName.sjjmje)=="") {
		alert("请输入[税金减免额]！");
		FormName.sjjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.sjjmje, "税金减免额"))) {
		return false;
	}

/*	
	if (FormName.sjjmje.value<0 || FormName.sjjmje.value>100)
	{
		alert("错误！[税金减免额]应该在0和100之间！");
		FormName.sjjmje.select();
		return false;
	}
*/

	
	if(	javaTrim(FormName.sjf)=="") {
		alert("请输入[设计费]！");
		FormName.sjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sjf, "设计费"))) {
		return false;
	}
	if(	javaTrim(FormName.suijinbfb)=="") {
		alert("请输入[税金百分比]！");
		FormName.suijinbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.suijinbfb, "税金百分比"))) {
		return false;
	}
	if (FormName.suijinbfb.value<0 || FormName.suijinbfb.value>100)
	{
		alert("错误！[税金百分比]应该在0和100之间！");
		FormName.suijinbfb.select();
		return false;
	}
	if(	javaTrim(FormName.suijin)=="") {
		alert("请输入[税金]！");
		FormName.suijin.select();
		return false;
	}
	if(!(isFloat(FormName.suijin, "税金"))) {
		return false;
	}
	if(	javaTrim(FormName.glf)=="") {
		alert("请输入[服务费]！");
		FormName.select.focus();
		return false;
	}
	if(!(isFloat(FormName.glf, "服务费"))) {
		return false;
	}

	if(	javaTrim(FormName.glfbfb)=="") {
		alert("请输入[管理费百分比]！");
		FormName.glfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.glfbfb, "管理费百分比"))) {
		return false;
	}
	if (FormName.glfbfb.value<0 || FormName.glfbfb.value>100)
	{
		alert("错误！[管理费百分比]应该在0和100之间！");
		FormName.glfbfb.select();
		return false;
	}
	if(	javaTrim(FormName.zqguanlif)=="") {
		alert("请输入[折前管理费]！");
		FormName.zqguanlif.select();
		return false;
	}
	if(!(isFloat(FormName.zqguanlif, "折前管理费"))) {
		return false;
	}
	if(	javaTrim(FormName.guanlif)=="") {
		alert("请输入[折后管理费]！");
		FormName.guanlif.select();
		return false;
	}
	if(!(isFloat(FormName.guanlif, "折后管理费"))) {
		return false;
	}


	if(	javaTrim(FormName.zqwjrqyexm)=="") {
		alert("请输入[折前其它收费－折前]！");
		FormName.zqwjrqyexm.select();
		return false;
	}
	if(!(isFloat(FormName.zqwjrqyexm, "折前其它收费－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.zhwjrqyexm)=="") {
		alert("请输入[折后其它收费－折前]！");
		FormName.zhwjrqyexm.select();
		return false;
	}
	if(!(isFloat(FormName.zhwjrqyexm, "折后其它收费－折前"))) {
		return false;
	}

	if (FormName.zqwjrqyexm.value!=0)
	{
		if(	javaTrim(FormName.wjrqyexmsm)=="") {
			alert("请输入[其它收费项目]！");
			FormName.wjrqyexmsm.select();
			return false;
		}
	}


	if(	javaTrim(FormName.pmjj)=="") {
		alert("请输入[每平米均价]！");
		FormName.pmjj.focus();
		return false;
	}
	if(!(isNumber(FormName.pmjj, "每平米均价"))) {
		return false;
	}






	if(	!radioChecked(FormName.sffj)) {
		alert("请选择[是否返券]！");
		FormName.sffj[0].focus();
		return false;
	}

	if (FormName.sffj[0].checked)
	{
		if(	javaTrim(FormName.fjje)=="") {
			alert("请输入[返卷总金额]！");
			FormName.fjje.focus();
			return false;
		}
		if(!(isFloat(FormName.fjje, "返卷总金额"))) {
			return false;
		}
		if(	javaTrim(FormName.gsfje)=="") {
			alert("请输入[公司承担返卷额]！");
			FormName.gsfje.focus();
			return false;
		}
		if(!(isFloat(FormName.gsfje, "公司承担返卷额"))) {
			return false;
		}
		if (parseFloat(FormName.fjje.value)<parseFloat(FormName.gsfje.value))
		{
			alert("[返卷总金额]不能小于[公司承担返卷额]！");
			FormName.gsfje.select();
			return false;
		}
	}
	else{
		FormName.fjje.value="";
		FormName.gsfje.value="";
	}

	if(	!radioChecked(FormName.sfyrz)) {
		alert("请选择[是否已认证]！");
		FormName.sfyrz[0].focus();
		return false;
	}
	if (FormName.sfyrz[0].checked)
	{
		if(	javaTrim(FormName.rzsc)=="") {
			alert("请输入[认证市场]！");
			FormName.rzsc.focus();
			return false;
		}
	}
	else{
		FormName.rzsc.value="";
	}

	if(	javaTrim(FormName.qyrq)=="") {
		alert("请输入[签约日期]！");
		FormName.qyrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "签约日期"))) {
		return false;
	}
	if (FormName.qyrq.value>"<%=cf.today()%>")
	{
		alert("[签约日期]不能大于[今天]！");
		FormName.qyrq.select();
		return false;
	}

	if (FormName.kgsjqd[0].checked)
	{
		if(	javaTrim(FormName.jyjdrq)=="") {
			alert("请输入[建议交底日期]！");
			FormName.jyjdrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jyjdrq, "建议交底日期"))) {
			return false;
		}
		if(	javaTrim(FormName.kgrq)=="") {
			alert("请输入[合同开工日期]！");
			FormName.kgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.kgrq, "合同开工日期"))) {
			return false;
		}
		if(	javaTrim(FormName.jgrq)=="") {
			alert("请输入[合同竣工日期]！");
			FormName.jgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jgrq, "合同竣工日期"))) {
			return false;
		}
		if (FormName.qyrq.value>FormName.jyjdrq.value)
		{
			alert("[建议交底日期]应大于[签约日期]！");
			FormName.jyjdrq.select();
			return false;
		}

		if (FormName.jyjdrq.value>FormName.kgrq.value)
		{
			alert("[合同开工日期]应大于[建议交底日期]！");
			FormName.kgrq.select();
			return false;
		}

		if (FormName.kgrq.value>=FormName.jgrq.value)
		{
			alert("[合同竣工日期]应大于[合同开工日期]！");
			FormName.jgrq.select();
			return false;
		}
	}
	else{
		if (FormName.jyjdrq.value!="")
		{
			alert("[开工时间]未确定，不能录入[建议交底日期]！");
			FormName.jyjdrq.select();
			return false;
		}
		if (FormName.kgrq.value!="")
		{
			alert("[开工时间]未确定，不能录入[合同开工日期]！");
			FormName.kgrq.select();
			return false;
		}
		if (FormName.jgrq.value!="")
		{
			alert("[开工时间]未确定，不能录入[合同竣工日期]！");
			FormName.jgrq.select();
			return false;
		}
	}



	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}


	if(	javaTrim(FormName.hdbz)=="") {
		alert("请选择[回单标志]！");
		FormName.hdbz.focus();
		return false;
	}

	if(FormName.hdbz.value=="1") {//1：非回单； 2：设计师回单；3：施工队回单；4：老客户回单
		FormName.cgdz.value="";
		FormName.hdr.value="";
		FormName.hdsgd.value="";
		FormName.hdsgbz.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
		FormName.hdsgd.disabled=true;
		FormName.hdsgbz.disabled=true;
	}
	else {
		if(	javaTrim(FormName.cgdz)=="") {
			alert("请输入[回单装修地址]！");
			FormName.cgdz.focus();
			return false;
		}
		if(	javaTrim(FormName.hdr)=="") {
			alert("请输入[回单人]！");
			FormName.hdr.focus();
			return false;
		}
		if(	javaTrim(FormName.hdsgd)=="") {
			alert("请输入[回单工地队长]！");
			FormName.hdsgd.focus();
			return false;
		}
		if(	javaTrim(FormName.hdsgbz)=="") {
			alert("请输入[回单工地班长]！");
			FormName.hdsgbz.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[信息录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[签约店面]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[所属分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxsjs, "会员有效时间始"))) {
		return false;
	}
	if(!(isDatetime(FormName.yxsjz, "会员有效时间止"))) {
		return false;
	}
	if(	!radioChecked(FormName.jzbz)) {
		alert("请选择[家装标志]！");
		FormName.jzbz[0].focus();
		return false;
	}

	if ( <%=sssjf%> < FormName.sjf.value/100.0*<%=(sjjryjbfb-0.5)%> )
	{
		alert("『设计费』录入错误！实收设计费『<%=sssjf%>』未达到公司实收标准『<%=sjjryjbfb%>』%规定");
		FormName.sjf.select();
		return false;
	}

	if(	javaTrim(FormName.gqts)=="") {
		alert("请选择[工期天数]！");
		FormName.gqts.focus();
		return false;
	}
	if(!(isNumber(FormName.gqts, "工期天数"))) {
		return false;
	}

	FormName.action="SaveInsertCrm_khxx.jsp";
	FormName.submit();

	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{

	FormName.action="/dzbj/zxbjmx/Bj_khbjmxDyList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
 
</CENTER>
</body>
</html>



 
</CENTER>
</body>
</html>


