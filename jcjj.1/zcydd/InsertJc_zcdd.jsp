<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String zt=request.getParameter("zt");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String khjl=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmbh="";
String dwmc=null;
String cxhdbm=null;
String zxdjbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String bzdh="";
String zjdh="";
String sjsdh="";
String dzdh=null;
String ssfgs=null;

String fkje=null;
String sqdj="";
String xmzy="";
String clgw="";

String ddbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int dds=0;
String dqbm="";


String zczkl="10";
String jjwjbz="";
String listSql="";
String jjsjs="";

try {
	conn=cf.getConnection();

	if (zt.equals("2"))//2:家装客户;4:非家装客户
	{
		ls_sql="select khxm,crm_khxx.xmzy,crm_khxx.clgw,fwdz,lxfs,hth,khjl,sjs,qye,kgrq,jgrq,fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq,crm_khxx.jjwjbz";
		ls_sql+=" from  sq_dwxx,crm_khxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xmzy=cf.fillNull(rs.getString("xmzy"));
			clgw=cf.fillNull(rs.getString("clgw"));
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			hth=cf.fillNull(rs.getString("hth"));
			khjl=cf.fillNull(rs.getString("khjl"));
			sjs=cf.fillNull(rs.getString("sjs"));
			qye=cf.fillNull(rs.getString("qye"));
			kgrq=cf.fillNull(rs.getDate("kgrq"));
			jgrq=cf.fillNull(rs.getDate("jgrq"));
			ssfgs=cf.fillNull(rs.getString("fgsbh"));
			dmbh=cf.fillNull(rs.getString("dwbh"));
			dwmc=cf.fillNull(rs.getString("dwmc"));
			cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

			zjxm=cf.fillNull(rs.getString("zjxm"));
			sgd=cf.fillNull(rs.getString("sgd"));
			sgbz=cf.fillNull(rs.getString("sgbz"));
			qyrq=cf.fillNull(rs.getDate("qyrq"));
			jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
		}
		rs.close();
		ps.close();
	}
	else{
		ls_sql="select khxm,crm_zxkhxx.clgw,fwdz,lxfs,khjl,sjs,crm_zxkhxx.ssfgs,crm_zxkhxx.zxdm,dwmc,cxhdbm,zxdjbm,zxdjbm";
		ls_sql+=" from  sq_dwxx,crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and  (crm_zxkhxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clgw=cf.fillNull(rs.getString("clgw"));
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			khjl=cf.fillNull(rs.getString("khjl"));
			sjs=cf.fillNull(rs.getString("sjs"));
			ssfgs=cf.fillNull(rs.getString("ssfgs"));
			dmbh=cf.fillNull(rs.getString("zxdm"));
			dwmc=cf.fillNull(rs.getString("dwmc"));
			cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
			zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
		}
		rs.close();
		ps.close();

		if (dmbh.equals(""))
		{
			ls_sql="select dwbh,dwmc";
			ls_sql+=" from  sq_dwxx";
			ls_sql+=" where dwbh='"+zxdjbm+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				dmbh=cf.fillNull(rs.getString("dwbh"));
				dwmc=cf.fillNull(rs.getString("dwmc"));
			}
			rs.close();
			ps.close();

		}

	}

	if (jjwjbz.equals("Y"))
	{
		out.println("错误！客户家居已完结，不能再录入订单");
		return;
	}


	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();


	ls_sql=" select dh from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  sq_dwxx.ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dmbh+"' and yhmc ='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	if (jjsjs.equals(""))
	{
		ls_sql="select cgsjs";
		ls_sql+=" from  jc_cgdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jjsjs=cf.fillNull(rs.getString("cgsjs"));
		}
		rs.close();
		ps.close();
	}

	if (jjsjs.equals(""))
	{
		ls_sql="select jjsjs";
		ls_sql+=" from  jc_jjdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jjsjs=cf.fillNull(rs.getString("jjsjs"));
		}
		rs.close();
		ps.close();
	}


	//活动订金
	double lsd=0;
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='51'";//11：家装款；21:木门；22:橱柜；23:主材；24：家具；31:木门订金；32:橱柜订金；33:主材订金；34：家具订金； 41：集成订金；51：促销活动订金；61：预付款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lsd=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (lsd>0)
	{
		fkje=lsd+"（活动订金）";
	}
	else{
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='33'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			lsd=rs.getDouble(1);
		}
		rs.close();
		ps.close();
	}

	if (lsd>0)
	{
		fkje=lsd+"（主材订金）";
	}
	else{
		fkje="未付订金";
	}




	int count=0;
	ls_sql="select NVL(max(substr(ddbh,8,2)),0)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ddbh=khbh+cf.addZero(count+1,2);


	ls_sql="SELECT count(*)";
	ls_sql+=" FROM jc_zcdd";
    ls_sql+=" where jc_zcdd.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dds=rs.getInt(1);
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">请录入主材预订单（订单编号：<%=ddbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" >
<%
if (dds>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="8%">订单编号</td>
		<td  width="9%">处理状态</td>
		<td  width="13%">子品牌</td>
		<td  width="6%">驻店家居顾问</td>
		<td  width="6%">展厅家居顾问</td>
		<td  width="6%">项目专员</td>
		<td  width="9%">合同总额</td>
		<td  width="9%">增减项金额</td>
		<td  width="9%">录入时间</td>
		<td  width="6%">录入人</td>
		<td  width="14%">备注</td>
	</tr>
	<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT jc_zcdd.ddbh,clztmc,ppbm,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.hkze,jc_zcdd.zjhze,jc_zcdd.lrsj,jc_zcdd.lrr,jc_zcdd.bz";
		ls_sql+=" FROM jc_zcdd,jdm_zcddzt";
		ls_sql+=" where jc_zcdd.khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
		ls_sql+=" order by jc_zcdd.zcdlbm,jc_zcdd.ppbm,jc_zcdd.ddbh";
		pageObj.sql=ls_sql;
		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//设置每页显示记录数
		pageObj.out=out;
		pageObj.getDate(1);

		pageObj.displayDate();
	%>
	</table>
	<%
}
%>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#CCCCFF"> 
                <div align="right">客户编号</div>              </td>
              <td width="32%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="18%" bgcolor="#CCCCFF"> 
                <div align="right">合同号</div>              </td>
              <td width="32%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">客户姓名</td>
              <td width="32%"><%=khxm%></td>
              <td width="18%" align="right">质检</td>
              <td width="32%"><%=zjxm%>（<%=zjdh%>） </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#CCCCFF" align="right">签约店面</td>
              <td width="32%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="18%" bgcolor="#CCCCFF" align="right">家装设计师</td>
              <td width="32%" bgcolor="#CCCCFF"><%=sjs%>（<%=sjsdh%>）</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right">施工队</div>              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>（<%=dzdh%>） </td>
              <td width="18%"> 
                <div align="right">班长</div>              </td>
              <td width="32%"><%=sgbz%>（<%=bzdh%>） </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right">家装签约日期</div>              </td>
              <td width="32%"> <%=qyrq%> </td>
              <td width="18%"> 
                <div align="right">家装签约额</div>              </td>
              <td width="32%"><%=qye%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">合同开工日期</td>
              <td width="32%"><%=kgrq%></td>
              <td width="18%" align="right">合同竣工日期</td>
              <td width="32%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%" align="right">参加促销活动</td>
              <td width="32%"> <%=cxhdbm%> </td>
              <td width="18%" align="right">订金</td>
              <td width="32%"><%=fkje%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>主材大类</td>
              <td width="32%"><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onchange="changeDl(insertform)">
                <option value=""></option>
                <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3')  order by cldlmc","");
%>
              </select></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>子品牌</td>
              <td colspan="3"><select name="ppbm" style="FONT-SIZE:12PX;WIDTH:520PX" onChange="changePp(insertform)">
              </select></td>
            </tr>
            
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000FF">优惠内容</font></td>
              <td colspan="3"  id="yhnr"></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>家居顾问</td>
              <td width="32%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
				if (clgw.equals(""))
				{
					out.println("<option value=\"\"></option>");

					listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
					listSql+=" UNION ALL ";
					listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
					listSql+=" ORDER BY c2 ";
					cf.selectItem(out,listSql,yhmc);
				}
				else{
					out.println("<option value=\""+clgw+"\">"+clgw+"</option>");
				}
%> 
                </select>              </td>
              <td width="18%" align="right">家居设计师</td>
              <td width="32%"><select name="jjsjs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	listSql="select sq_yhxx.yhmc c1,sq_yhxx.yhmc||':'||sq_yhxx.dh c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='12' and sq_yhxx.sfzszg in('Y','N') ";
	listSql+=" UNION ALL ";
	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||':'||sq_yhxx.dh c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='12' and sq_yhxx.sfzszg in('Y','N') ";
	listSql+=" ORDER BY c2 ";
	cf.selectItem(out,listSql,jjsjs);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>产品类型</td>
              <td><input type="radio" name="xclbz" value="2" checked>
定制式产品</td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">录入部门</font></div>              </td>
              <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>              </td>
              <td width="18%" align="right">计划测量时间</td>
              <td width="32%"> 
                <input type="text" name="jhclsj" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></div>              </td>
              <td width="32%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></div>              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="xmzy" value="" >
                <input type="hidden" name="ztjjgw" value="" >
                <input type="hidden" name="ddbh" value="<%=ddbh%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="fgsbh" value="<%=ssfgs%>" >
                <input type="hidden" name="qddm" value="<%=dmbh%>" >
                <input type="hidden" name="khjl" value="<%=khjl%>" >
                <input type="hidden" name="jzsjs" value="<%=sjs%>" >
                <input type="hidden" name="dqbm" value="<%=dqbm%>" >
                <input type="hidden" name="zt" value="<%=zt%>">
                <input type="hidden" name="zczkl" value="<%=zczkl%>">
                <input type="hidden" name="dzyy2" value="">
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
                <input type="hidden" name="zcxlbm" value=""></td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


<%
	//启用Ajax
	cf.ajax(out);
%>

var czlx;



function changeDl(FormName)
{
	czlx=3;

	FormName.ppbm.length=1;

	var sql="select jxc_ppxx.ppmc c1,jxc_ppxx.ppmc||NVL2(yhkssj,'（优惠期'||TO_CHAR(yhkssj,'YYYY-MM-DD')||'至'||TO_CHAR(yhjzsj,'YYYY-MM-DD')||'）','') c2 from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+FormName.fgsbh.value+"' and jxc_ppxx.cldl='"+FormName.zcdlbm.value+"' order by jxc_ppxx.ppmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);
	openAjax(actionStr);
}


function changePp(FormName)
{
	czlx=4;

	var sql="select sfyyh,yhkssj,yhjzsj,yhnr ";
	sql+=" from  jxc_ppxx,jxc_ppgysdzb";
	sql+=" where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm ";
	sql+=" and jxc_ppgysdzb.ssfgs='<%=ssfgs%>' and jxc_ppxx.ppmc='"+FormName.ppbm.value+"'";

	var actionStr="/jcjj/zcdd/getPpYhnr.jsp?sql="+sql;

//	window.open(actionStr);

	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	if (czlx==3)
	{
		strToSelect(insertform.ppbm,ajaxRetStr);
	}
	else if (czlx==4)
	{
		document.getElementById('yhnr').innerHTML="";
		txtNode=document.createTextNode(ajaxRetStr);//供应商
		document.getElementById('yhnr').appendChild(txtNode);
	}
}








function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("请选择[主材大类]！");
		FormName.zcdlbm.focus();
		return false;
	}

	if(	javaTrim(FormName.ppbm)=="") {
		alert("请选择[子品牌]！");
		FormName.ppbm.focus();
		return false;
	}
	if(	javaTrim(FormName.clgw)=="") {
		alert("请输入[家居顾问]！");
		FormName.clgw.focus();
		return false;
	}
	if(	javaTrim(FormName.xclbz)=="") {
		alert("请选择[产品类型]！");
		FormName.xclbz.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhclsj, "计划测量时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[录入部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zczkl)=="") {
		alert("请输入[订单折扣]！");
		FormName.zczkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zczkl, "订单折扣"))) {
		return false;
	}
	if (FormName.zczkl.value<=0 || FormName.zczkl.value>10)
	{
		alert("错误！[订单折扣]应该在0和10之间！");
		FormName.zczkl.select();
		return false;
	}
	if (FormName.zczkl.value!=10)
	{
		if(	javaTrim(FormName.dzyy)=="") {
			alert("请输入[打折原因]！");
			FormName.dzyy.focus();
			return false;
		}
	}

	FormName.action="SaveInsertJc_zcdd.jsp";
	FormName.submit();
	return true;

}
//-->
</SCRIPT>
