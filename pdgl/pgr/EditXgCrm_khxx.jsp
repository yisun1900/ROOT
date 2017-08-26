<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String yhmc=(String)session.getAttribute("yhmc");

String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String dwbh=null;
String ssfgs=null;


double qye=0;
String fwmj=null;
String pmjj=null;


String khlxbm=null;
String jzbz=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String bz=null;

String jlbz=null;
String pdsj=null;
String pdr=null;
String pdsm=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;
String zjxm=null;

String mgfrz=null;
String nwgfrz=null;
String sdgfrz=null;
String yqgfrz=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select hth,khxm,lxfs,fwdz,sjs,crm_khxx.dwbh,crm_khxx.fgsbh,pmjj,qye,fwmj,DECODE(jzbz,'1','家装工程','2','公装工程') jzbz,khlxbm ";
	ls_sql+=" ,qyrq,jyjdrq,kgrq,jgrq,crm_khxx.bz,jlbz,pdsj,pdr,pdsm,crm_khxx.sgd,sgdmc,sgbz,zjxm,mgfrz,nwgfrz,sdgfrz,yqgfrz ";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where khbh='"+khbh+"' and crm_khxx.sgd=sq_sgd.sgd";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		qye=rs.getDouble("qye");
		jzbz=cf.fillNull(rs.getString("jzbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));

		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		bz=cf.fillNull(rs.getString("bz"));

		jlbz=cf.fillNull(rs.getString("jlbz"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		pdr=cf.fillNull(rs.getString("pdr"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		pdsm=cf.fillNull(rs.getString("pdsm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));

		mgfrz=cf.fillNull(rs.getString("mgfrz"));
		nwgfrz=cf.fillNull(rs.getString("nwgfrz"));
		sdgfrz=cf.fillNull(rs.getString("sdgfrz"));
		yqgfrz=cf.fillNull(rs.getString("yqgfrz"));
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>

<html>
<head>
<title>派单</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">派工人－维护</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                <font color="#000099">客户编号</font>              </td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"> <%=khbh%> 
              </font></td>
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#000099"> 
              合同号              </font></td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"><%=hth%> 
                </font></td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#000099">客户姓名</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"><%=khxm%></font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#000099">设计师</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"><%=sjs%>（<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%>） </font></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right"><font color="#000099">房屋地址</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000"><%=fwdz%></font></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">客户类型</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000">
                <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%>
              </font></td>
            </tr>
            
            <tr> 
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#000099">工程签约额</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"><%=qye%></font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#000099">是否家装</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"><%=jzbz%></font></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">建筑面积</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000"><%=fwmj%></font></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">每平米均价</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000"><%=pmjj%></font></td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                <font color="#000099">签约日期</font>              </td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"> <%=qyrq%> 
              </font></td>
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#000099">建议交底日期</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"><%=jyjdrq%></font></td>
            </tr>
            
            <tr bgcolor="#FFCCCC">
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">合同开工日期</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000"><%=kgrq%></font></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">合同竣工日期</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000"><%=jgrq%></font></td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#000099">备注</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><%=bz%></td>
            </tr>
            
            <tr> 
              <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#000099"> 
              派单类型              </font></td>
              <td width="32%" bgcolor="#FFFFCC"> 
                  <%
	cf.selectToken(out,"0+人工派单&1+回单奖励&2+公司奖励&3+设计师指定派单&4+客户指定派单&7+特殊情况&9+同小区派单",jlbz,true);
%>              </td>
              <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#000099">质检</font></td>
              <td width="32%" bgcolor="#FFFFCC"><%=zjxm%></td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#000099"> 
              派单人              </font></td>
              <td width="32%" bgcolor="#FFFFCC"><%=pdr%></td>
              <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#000099"> 
              派单时间              </font></td>
              <td width="32%" bgcolor="#FFFFCC"><%=pdsj%></td>
            </tr>
            
            <tr>
              <td bgcolor="#FFFFCC" align="right"><font color="#000099">施工队</font></td>
              <td bgcolor="#FFFFCC"><%=sgdmc%></td>
              <td bgcolor="#FFFFCC" align="right"><font color="#000099">班长</font></td>
              <td bgcolor="#FFFFCC"><%=sgbz%></td>
            </tr>
            
            <tr>
              <td align="right" bgcolor="#FFFFCC"><font color="#000099"> 施工队派单说明 </font></td>
              <td colspan="3" bgcolor="#FFFFCC"><%=pdsm%></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFCC" align="right">木工</td>
              <td bgcolor="#FFFFCC"><select name="mgfrz" style="FONT-SIZE:12PX;WIDTH:180PX" multiple size="8">
                <option value=""></option>
                <%
	cf.mutilSelectItem(out,"select sq_grxxb.xm,sq_grxxb.xm||'（'||sgdmc||'）' from sq_grxxb,sq_sgd where sq_grxxb.sgd=sq_sgd.sgd(+) and sq_grxxb.gz='木工' order by sq_grxxb.sgd,sq_grxxb.xm","select grxm from crm_grxx where  khbh='"+khbh+"' and grgz='木工'");
%>
              </select></td>
              <td bgcolor="#FFFFCC" align="right">泥瓦工</td>
              <td bgcolor="#FFFFCC"><select name="nwgfrz" style="FONT-SIZE:12PX;WIDTH:180PX" multiple size="8">
                <option value=""></option>
                <%
	cf.mutilSelectItem(out,"select sq_grxxb.xm,sq_grxxb.xm||'（'||sgdmc||'）' from sq_grxxb,sq_sgd where sq_grxxb.sgd=sq_sgd.sgd(+) and sq_grxxb.gz='瓦工' order by sq_grxxb.sgd,sq_grxxb.xm","select grxm from crm_grxx where  khbh='"+khbh+"' and grgz='泥瓦工'");
%>
              </select></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFCC" align="right">水电工</td>
              <td bgcolor="#FFFFCC"><select name="sdgfrz" style="FONT-SIZE:12PX;WIDTH:180PX" multiple size="8">
                <option value=""></option>
                <%
	cf.mutilSelectItem(out,"select sq_grxxb.xm,sq_grxxb.xm||'（'||sgdmc||'）' from sq_grxxb,sq_sgd where sq_grxxb.sgd=sq_sgd.sgd(+) and sq_grxxb.gz='水电工' order by sq_grxxb.sgd,sq_grxxb.xm","select grxm from crm_grxx where  khbh='"+khbh+"' and grgz='水电工'");
%>
              </select></td>
              <td bgcolor="#FFFFCC" align="right">油漆工</td>
              <td bgcolor="#FFFFCC"><select name="yqgfrz" style="FONT-SIZE:12PX;WIDTH:180PX" multiple size="8">
                <option value=""></option>
                <%
	cf.mutilSelectItem(out,"select sq_grxxb.xm,sq_grxxb.xm||'（'||sgdmc||'）' from sq_grxxb,sq_sgd where sq_grxxb.sgd=sq_sgd.sgd(+) and sq_grxxb.gz='油漆工' order by sq_grxxb.sgd,sq_grxxb.xm","select grxm from crm_grxx where  khbh='"+khbh+"' and grgz='油漆工'");
%>
              </select></td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
				<input type="hidden" name="khbh"  value="<%=khbh%>" >
                <input type="button"  value="保存" onClick="f_do(editform)">
                <input type="reset"  value="重输"></td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	FormName.mgfrz.value=="" && FormName.nwgfrz.value=="" && FormName.sdgfrz.value=="" && FormName.yqgfrz.value=="") {
		alert("请选择[工人]！");
		FormName.mgfrz.focus();
		return false;
	}

	FormName.action="SaveEditXgCrm_khxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>

