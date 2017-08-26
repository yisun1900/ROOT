<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String sgd=null;
String pdsj=null;
String hfsj=null;
String hfr=null;
String hfjl=null;
String jjyy=null;
String hsqk=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String wheresgd=cf.GB2Uni(request.getParameter("sgd"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;


String khxm=null;
String cqbm=null;
String fwdz=null;
String sjs=null;
String lxfs=null;
String qyrq=null;
String kgrq=null;
String dwbh=null;
String lrsj=null;
String pmjj=null;
String qye=null;
String hdbz=null;
String khlxbm=null;
String bz=null;


try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,sgd,pdsj,hfsj,hfr,hfjl,jjyy,hsqk ";
	ls_sql+=" from  pd_pdjl";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (sgd='"+wheresgd+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		hfr=cf.fillNull(rs.getString("hfr"));
		hfjl=cf.fillNull(rs.getString("hfjl"));
		jjyy=cf.fillNull(rs.getString("jjyy"));
		hsqk=cf.fillNull(rs.getString("hsqk"));
	}
	rs.close();


	ls_sql="select khxm,cqbm,fwdz,sjs,lxfs,qyrq,kgrq,dwbh,lrsj,pmjj,qye,hdbz,khlxbm,bz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		qye=cf.fillNull(rs.getString("qye"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>�ܾ��ɵ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �ܾ��ɵ�����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="31%"> <font color="#000000"> <%=khbh%> 
                </font></td>
              <td width="18%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="32%"> <font color="#000000"> <%=khxm%> </font></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">����</td>
              <td width="31%"> <font color="#000000"> <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%> </font></td>
              <td width="18%" align="right">���ݵ�ַ</td>
              <td width="32%"><font color="#000000"> <%=fwdz%> </font></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="31%"> <font color="#000000"> <%=sjs%> </font></td>
              <td width="18%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="32%"> <font color="#000000"> <%=lxfs%> </font></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="31%"> <font color="#000000"> <%=qyrq%> </font></td>
              <td width="18%"> 
                <div align="right">Ӧ��������</div>
              </td>
              <td width="32%"> <font color="#000000"> <%=kgrq%> </font></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="31%"> <font color="#000000"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </font></td>
              <td width="18%"> 
                <div align="right">¼��ʱ��</div>
              </td>
              <td width="32%"> <font color="#000000"> <%=lrsj%> </font></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">ǩԼ��</td>
              <td width="31%"><font color="#000000"><%=qye%></font></td>
              <td width="18%" align="right">ÿƽ�׾���</td>
              <td width="32%"><font color="#000000"><%=pmjj%></font></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">�ص���־</td>
              <td width="31%"> <font color="#000000"><%
	cf.selectToken(out,"1+�ǻص�&2+���ʦ�ص�&3+ʩ���ӻص�&4+�Ͽͻ��ص�&5+Ա���ص�&6+�೤�ص�&7+��¥��&8+������&9+����",hdbz,false);
%> </font></td>
              <td width="18%" align="right">�ͻ�����</td>
              <td width="32%"> <font color="#000000"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%> </font></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">��ע</td>
              <td colspan="3"><%=bz%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">����ʩ����</font></div>
              </td>
              <td width="35%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='3' order by dwbh",sgd,true);
%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�ɵ�ʱ��</font></div>
              </td>
              <td width="35%"><%=pdsj%> </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�ظ���</font></div>
              </td>
              <td width="35%"><%=hfr%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�ظ�ʱ��</font></div>
              </td>
              <td width="35%"> <%=hfsj%> </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�ظ�����</font></div>
              </td>
              <td width="35%"> <%
	cf.selectToken(out,"0+δ�ظ�&4+�����ɵ�&3+�ܾ��ɵ�&5+����ԭ��",hfjl,true);
%> </td>
              <td width="15%"> 
                <div align="right"></div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="15%" align="right"><font color="#0000CC">�ܾ�ԭ��</font></td>
              <td colspan="3"><%=jjyy%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ʵ���</div>
              </td>
              <td colspan="3"> 
                <textarea name="hsqk" cols="55" rows="3"><%=hsqk%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <input type="hidden" name="wheresgd"  value="<%=wheresgd%>" >
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                </div>
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.hsqk)=="") {
		alert("������[��ʵ���]��");
		FormName.hsqk.focus();
		return false;
	}

	FormName.action="SaveDcPd_pdjl.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
