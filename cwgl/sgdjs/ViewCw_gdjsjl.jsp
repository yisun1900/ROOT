<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�鿴���� </title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
String gdjsjlh=request.getParameter("gdjsjlh");

///////////////��������
String khbh=null;
String sgd=null;
String khlx=null;
String cxhdbm=null;
double zkl=0;
double wdzgce=0;
double qye=0;
double zjxje=0;
double zhzjxje=0;
double zqwgzj=0;
double zhwgzj=0;
double khsskze=0;
double glftd=0;
double glf=0;
double gdjskze=0;

///////////////���ۿ���Ŀ
double clf=0;
double bzclfbl=0;
double xbclk=0;
double psgjgff=0;
double ysf=0;
double wxjbfb=0;
double wxj=0;
double gcjxkk=0;
double sj=0;
double lbcb=0;
double kqtk=0;

///////////////������
double jkje=0;
double sqgz=0;
double gczxjl=0;
double ycfbk=0;

String jslx=null;
String jsr=null;
String jsdw=null;
String jssj=null;
String bz=null;


String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String hth=null;
String qyrq=null;
String kgrq=null;
String sjkgrq=null;
String jgrq=null;
String sjjgrq=null;
String sjwjrq=null;
String dwbh=null;
String zjxm=null;
String jzbz=null;
String zjxwcbz=null;
String fgsbh=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	ls_sql="select khbh,sgd,khlx,cxhdbm,zkl,wdzgce,qye,zjxje,zhzjxje ";
	ls_sql+=" ,zqwgzj,zhwgzj,khsskze,glftd,glf,gdjskze,clf,bzclfbl,xbclk,psgjgff ";
	ls_sql+=" ,ysf,wxjbfb,wxj,gcjxkk,sj,lbcb,kqtk,jkje,sqgz,gczxjl ";
	ls_sql+=" ,ycfbk,jslx,jsdw,jsr,jssj,bz,jsjd,fkbz ";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where gdjsjlh='"+gdjsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		khlx=cf.fillNull(rs.getString("khlx"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		zkl=rs.getDouble("zkl");
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");

		zqwgzj=rs.getDouble("zqwgzj");
		zhwgzj=rs.getDouble("zhwgzj");
		khsskze=rs.getDouble("khsskze");
		glftd=rs.getDouble("glftd");
		glf=rs.getDouble("glf");
		gdjskze=rs.getDouble("gdjskze");
		clf=rs.getDouble("clf");
		bzclfbl=rs.getDouble("bzclfbl");
		xbclk=rs.getDouble("xbclk");
		psgjgff=rs.getDouble("psgjgff");

		ysf=rs.getDouble("ysf");
		wxjbfb=rs.getDouble("wxjbfb");
		wxj=rs.getDouble("wxj");
		gcjxkk=rs.getDouble("gcjxkk");
		sj=rs.getDouble("sj");
		lbcb=rs.getDouble("lbcb");
		kqtk=rs.getDouble("kqtk");
		jkje=rs.getDouble("jkje");
		sqgz=rs.getDouble("sqgz");
		gczxjl=rs.getDouble("gczxjl");

		ycfbk=rs.getDouble("ycfbk");
		jslx=cf.fillNull(rs.getString("jslx"));
		jsdw=cf.fillNull(rs.getString("jsdw"));
		jsr=cf.fillNull(rs.getString("jsr"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	ls_sql="select fgsbh,jzbz,khxm,fwdz,lxfs,sjs,hth,qyrq,dwbh,sgd,zjxm,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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
      <div align="center">ʩ���ӽ��㣨�����¼�ţ�<%=gdjsjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td colspan="4" align="center"> 
                  <input type="button" onClick="window.open('/cwgl/kqtk/Cw_kqtkjlCxList.jsp?fgs=<%=fgsbh%>&khbh=<%=khbh%>')" value="�����ۿ���ϸ">
                  <input type="button" onClick="window.open('/cwgl/sgdjk/Cw_gdjkjlCxList.jsp?crm_khxx_sgd=<%=sgd%>&fgs=<%=fgsbh%>&scbz=N')" value="ǰ�ڲ����¼">
                  <input type="button" onClick="window.open('/fcgl/cl_ckd/Cl_ckdCxList.jsp?khbh=<%=khbh%>&fgs=<%=fgsbh%>&myxssl=30')" value="���ϳ�����ϸ" >
                  <input type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="�ͻ��տ���Ϣ">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">�ͻ����</td>
              <td><%=khbh%></td>
              <td align="right">��ͬ��</td>
              <td><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td> 
                <div align="right">�ͻ�����</div>
              </td>
              <td><%=khxm%> </td>
              <td> 
                <div align="right">�ʼ�����</div>
              </td>
              <td><%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">���ݵ�ַ</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td> 
                <div align="right">ǩԼ����</div>
              </td>
              <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td> 
                <div align="right">���ʦ</div>
              </td>
              <td><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">ǩԼ����</td>
              <td><%=qyrq%></td>
              <td align="right">ʵ���������</td>
              <td><%=sjwjrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">��ͬ��������</td>
              <td><%=kgrq%></td>
              <td align="right">��ͬ��������</td>
              <td><%=jgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">ʵ�ʿ�������</td>
              <td><%=sjkgrq%></td>
              <td align="right">ʵ�ʿ�������</td>
              <td><%=sjjgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td height="28" colspan="4" align="center"><b><font color="#000099">��������</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">ʩ����</font></td>
              <td> 
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> 
              </td>
              <td align="right"><font color="#0000FF">�ͻ�����</font></td>
              <td> 
                  <%
	cf.selectToken(out,"1+�Ǽӻ�ͻ�&2+�μӻ�ͻ�",khlx,true);
%> 
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">�μӴ����</font></td>
              <td> <%=cxhdbm%>
              </td>
              <td align="right"><font color="#0000FF">�ۿ���</font></td>
              <td> <%=zkl%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">����ԭ����</font></td>
              <td> <%=wdzgce%>
              </td>
              <td align="right"><font color="#0000FF">����ǩԼ��</font></td>
              <td> <%=qye%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">��ǰ��������</font></td>
              <td> <%=zjxje%>
              </td>
              <td align="right"><font color="#0000FF">�ۺ���������</font></td>
              <td> <%=zhzjxje%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">��ǰ�깤���</font></td>
              <td> <%=zqwgzj%>
              </td>
              <td align="right"><font color="#0000FF">�����깤���</font></td>
              <td> <%=zhwgzj%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">��װʵ�տ��ܶ�</font></td>
              <td> <%=khsskze%>
              </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">����ѱ���</td>
              <td> <%=glftd%>
                % </td>
              <td align="right"><font color="#0000FF">�����</font></td>
              <td> <%=glf%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">Ӧ������</font></td>
              <td colspan="3"> <%=gdjskze%>
                &nbsp;&nbsp;<b>< Ӧ�����ѣ������깤��ۡ���1-����ѱ����� ></b> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" height="30" align="center"><b><font color="#000099">���ۿ���Ŀ</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���Ϸ�</td>
              <td width="32%"> <%=clf%>
              </td>
              <td width="18%" align="right">��׼���Ϸѱ���</td>
              
            <td width="32%"> <%=bzclfbl%>% </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���Ͽۿ�</td>
              <td colspan="3"><%=xbclk%><b> 
               �����Ͽۿ�����Ͽ�-���Ͽ����18%ʱ�Ĳ�����Ϊ���Ͽۿ</b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���͹��߹�����</td>
              <td width="32%"> <%=psgjgff%>
              </td>
              <td width="18%" align="right">�����</td>
              <td width="32%"> <%=ysf%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���ʱ���ٷֱ�</td>
              <td width="32%"> <%=wxjbfb%>
                % </td>
              <td width="18%" align="right">���ʱ���</td>
              <td width="32%"> <%=wxj%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���̼���ۿ�</td>
              <td width="32%"> <%=gcjxkk%>
              </td>
              <td width="18%" align="right">˰��</td>
              <td width="32%"> <%=sj%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">����ɱ�</td>
              <td width="32%"> <%=lbcb%>
              </td>
              <td width="18%" align="right">�����ۿ�</td>
              <td width="32%"> <%=kqtk%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF" align="center"> 
              <td colspan="4" height="22"><b><font color="#000099">������</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">ǰ���Ѳ�����</td>
              <td width="32%"> <%=jkje%>
              </td>
              <td width="18%" align="right">Ӧ������</td>
              <td width="32%"> <%=sqgz%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right"><b>Ӧ������=</b><font color="#003399">Ӧ������-���Ϸ�+��׼���Ϸѱ���-���Ͽۿ�-���͹��߹�����-�����-���ʱ���-���̼���ۿ�-˰��-����ɱ�-�����ۿ�-ǰ���Ѳ�����</font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���������</td>
              <td width="32%"> <%=gczxjl%>
              </td>
              <td width="18%" align="right">Զ�̷Ѳ���</td>
              <td width="32%"> <%=ycfbk%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="25">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">��������</font></td>
              <td> 
                  <%
	cf.selectToken(out,"1+�깤����&2+���ڽ���",jslx,true);
%> 
              </td>
              <td align="right"><font color="#0000FF">���㵥λ</font></td>
              <td> 
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jsdw+"'",jsdw,true);
%> 
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000FF">������</font></div>
              </td>
              <td width="32%"> <%=jsr%>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000FF">����ʱ��</font></div>
              </td>
              <td width="32%"> <%=jssj%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> <%=bz%>
              </td>
            </tr>
          </table>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
