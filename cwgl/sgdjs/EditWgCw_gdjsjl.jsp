<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�޸Ľ��� </title>
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

double sjclf=0;
double tlk=0;


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

	//���Ϸ�
	ls_sql="select sum(cl_ckmx.ckje)";
	ls_sql+=" from  cl_ckd,cl_ckmx";
	ls_sql+=" where cl_ckd.ckph=cl_ckmx.ckph and cl_ckd.khbh='"+khbh+"'";
	ls_sql+=" and cl_ckd.lx='1'  and cl_ckmx.cldlmc!='����'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjclf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//�����շ�
	double allqtsf=0;
	ls_sql="select sum(cl_ckd.qtsf)";
	ls_sql+=" from  cl_ckd";
	ls_sql+=" where cl_ckd.khbh='"+khbh+"' and cl_ckd.lx='1'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allqtsf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//���Ͽ�
	ls_sql="select sum(-1*cl_ckmx.ckje)";
	ls_sql+=" from  cl_ckd,cl_ckmx";
	ls_sql+=" where cl_ckd.ckph=cl_ckmx.ckph and cl_ckd.khbh='"+khbh+"'";
	ls_sql+=" and cl_ckd.lx='2'  and cl_ckmx.cldlmc!='����'";//1�����⣻2���˻�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tlk=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//�����շ�
	ls_sql="select sum(cl_ckd.qtsf)";
	ls_sql+=" from  cl_ckd";
	ls_sql+=" where cl_ckd.khbh='"+khbh+"' and cl_ckd.lx='2'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allqtsf=allqtsf-rs.getDouble(1);
	}
	rs.close();
	ps.close();

	sjclf=cf.doubleTrim(sjclf-tlk+allqtsf);

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
      <div align="center">ʩ�������ڽ��㣨�����¼�ţ�<%=gdjsjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">
<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
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
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%> 
                </select>
              </td>
              <td align="right"><font color="#0000FF">�ͻ�����</font></td>
              <td> 
                <select name="khlx" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectToken(out,"1+�Ǽӻ�ͻ�&2+�μӻ�ͻ�",khlx,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">�μӴ����</font></td>
              <td> 
                <input type="text" name="cxhdbm" value="<%=cxhdbm%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right"><font color="#0000FF">�ۿ���</font></td>
              <td> 
                <input type="text" name="zkl" value="<%=zkl%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">����ԭ����</font></td>
              <td> 
                <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right"><font color="#0000FF">����ǩԼ��</font></td>
              <td> 
                <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">��ǰ��������</font></td>
              <td> 
                <input type="text" name="zjxje" value="<%=zjxje%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right"><font color="#0000FF">�ۺ���������</font></td>
              <td> 
                <input type="text" name="zhzjxje" value="<%=zhzjxje%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">��ǰ�깤���</font></td>
              <td> 
                <input type="text" name="zqwgzj" value="<%=zqwgzj%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right"><font color="#0000FF">�ۺ��깤���</font></td>
              <td> 
                <input type="text" name="zhwgzj" value="<%=zhwgzj%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">��װʵ�տ��ܶ�</font></td>
              <td> 
                <input type="text" name="khsskze" value="<%=khsskze%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">����ѱ���</td>
              <td> 
                <input type="text" name="glftd" value="<%=glftd%>" size="10" maxlength="17" onChange="f_jsglf(insertform)">
                % </td>
              <td align="right"><font color="#0000FF">�����</font></td>
              <td> 
                <input type="text" name="glf" value="<%=glf%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">Ӧ������</font></td>
              <td colspan="3"> 
                <input type="text" name="gdjskze" value="<%=gdjskze%>" size="20" maxlength="17" readonly>
                &nbsp;&nbsp;<b>Ӧ�����ѣ��ۺ��깤��ۡ���1-����ѱ�����</b> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" height="30" align="center"><b><font color="#000099">���ۿ���Ŀ</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��׼���Ϸѱ���</td>
              <td width="32%">
                <input type="text" name="bzclfbl" value="<%=bzclfbl%>" size="10" maxlength="17" onChange="f_clfbl(insertform)">
                % </td>
              <td width="18%" align="right">���Ϸ�</td>
              <td width="32%">
                <input type="text" name="clf" value="<%=clf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���Ͽۿ�</td>
              <td colspan="3"><b> 
                <input type="text" name="xbclk" value="<%=xbclk%>" size="20" maxlength="17" >
                ���Ͽۿ���Ϸѽ���18%ʱ�Ĳ�����Ϊ���Ͽۿ�</b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���͹��߹�����</td>
              <td width="32%"> 
                <input type="text" name="psgjgff" value="<%=psgjgff%>" size="20" maxlength="17" >
              </td>
              <td width="18%" align="right">�����</td>
              <td width="32%"> 
                <input type="text" name="ysf" value="<%=ysf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���ʱ���ٷֱ�</td>
              <td width="32%"> 
                <input type="text" name="wxjbfb" value="<%=wxjbfb%>" size="10" maxlength="17" >
                % </td>
              <td width="18%" align="right">���ʱ���</td>
              <td width="32%"> 
                <input type="text" name="wxj" value="<%=wxj%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���̼���ۿ�</td>
              <td width="32%"> 
                <input type="text" name="gcjxkk" value="<%=gcjxkk%>" size="20" maxlength="17" >
              </td>
              <td width="18%" align="right">˰��</td>
              <td width="32%"> 
                <input type="text" name="sj" value="<%=sj%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">����ɱ�</td>
              <td width="32%"> 
                <input type="text" name="lbcb" value="<%=lbcb%>" size="20" maxlength="17" onChange="f_jsglf(insertform)">
              </td>
              <td width="18%" align="right">�����ۿ�</td>
              <td width="32%"> 
                <input type="text" name="kqtk" value="<%=kqtk%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF" align="center"> 
              <td colspan="4" height="22"><b><font color="#000099">������</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">ǰ���Ѳ�����</td>
              <td width="32%"> 
                <input type="text" name="jkje" value="<%=jkje%>" size="20" maxlength="17" readonly>
              </td>
              <td width="18%" align="right">Ӧ������</td>
              <td width="32%"> 
                <input type="text" name="sqgz" value="<%=sqgz%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right"><b>Ӧ������=</b><font color="#003399">Ӧ������-���Ϸ�+���Ͽ�-���Ͽۿ�-���͹��߹�����-�����-���ʱ���-���̼���ۿ�-˰��-����ɱ�-�����ۿ�-ǰ���Ѳ�����</font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���������</td>
              <td width="32%"> 
                <input type="text" name="gczxjl" value="<%=gczxjl%>" size="20" maxlength="17" >
              </td>
              <td width="18%" align="right">Զ�̷Ѳ���</td>
              <td width="32%"> 
                <input type="text" name="ycfbk" value="<%=ycfbk%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="25">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">��������</font></td>
              <td> 
                <select name="jslx" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectToken(out,"1+�깤����&2+���ڽ���",jslx,false);
%> 
                </select>
              </td>
              <td align="right"><font color="#0000FF">���㵥λ</font></td>
              <td> 
                <select name="jsdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jsdw+"'",jsdw);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000FF">������</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="jsr" value="<%=jsr%>" size="20" maxlength="20" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000FF">����ʱ��</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="jssj" value="<%=jssj%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <p> 
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset"  value="����" name="reset">
                  <input type="button" onClick="window.open('/cwgl/kqtk/Cw_kqtkjlCxList.jsp?fgs=<%=fgsbh%>&khbh=<%=khbh%>&cw_kqtkjl_jsbz=Y&cw_kqtkjl_jsjlh=<%=gdjsjlh%>')" value="�����ۿ���ϸ">
                  <input type="button" onClick="window.open('/cwgl/sgdjk/Cw_gdjkjlCxList.jsp?crm_khxx_sgd=<%=sgd%>&fgs=<%=fgsbh%>&scbz=N&cw_gdjkjl_gdjsjd=1&cw_gdjkjl_gdjsjlh=<%=gdjsjlh%>')" value="ǰ�ڲ����¼">
                  <input type="button" onClick="window.open('/fcgl/cl_ckd/Cl_ckdCxList.jsp?khbh=<%=khbh%>&fgs=<%=fgsbh%>&myxssl=30&jsbz=Y&jsjlh=<%=gdjsjlh%>')" value="���ϳ�����ϸ" >
                  <input type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="�ͻ��տ���Ϣ">
                  <input name="button" type="button" onClick="window.open('/cwgl/sgdjs/DyWgDzd.jsp?khbh=<%=khbh%>')" value="�깤���˵�" >
                  <input type="hidden" name="khbh" value="<%=khbh%>" >
                  <input type="hidden" name="gdjsjlh" value="<%=gdjsjlh%>" >
				<input type="button"  value="�鿴��ʩ�����ʱ���" onClick="window.open('/cwgl/zbjgl/cx/ViewSgdZbj.jsp?sgd='+sgd.value)">
                </p>
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
function f_clfbl(FormName)
{
	var bzclf=0;//���Ϸ�
	bzclf=<%=zhwgzj%>*FormName.bzclfbl.value/100;
	bzclf=round(bzclf,2);

	var xbclk=0;//���Ͽۿ�
	if (bzclf > <%=sjclf%> )//���Ͽۿ���Ϸѽ���18%ʱ�Ĳ�����Ϊ���Ͽۿ�
	{
		xbclk=round(bzclf-<%=sjclf%>);//���Ͽۿ���Ϸѽ���18%ʱ�Ĳ�����Ϊ���Ͽۿ�
	}
	
	FormName.xbclk.value=xbclk;
}

function f_jsglf(FormName)//����FormName:Form������
{
	//��������
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.khlx)=="") {
		alert("��ѡ��[�ͻ�����]��");
		FormName.khlx.focus();
		return false;
	}
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("��ѡ��[�μӴ����]��");
		FormName.cxhdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("������[�ۿ���]��");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "�ۿ���"))) {
		return false;
	}
	if (FormName.zkl.value<0 || FormName.zkl.value>10)
	{
		alert("����[�ۿ���]Ӧ����0��10֮�䣡");
		FormName.zkl.select();
		return false;
	}

	if(	javaTrim(FormName.wdzgce)=="") {
		alert("������[����ԭ����]��");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "����ԭ����"))) {
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("������[����ǩԼ��]��");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "����ǩԼ��"))) {
		return false;
	}

	if(	javaTrim(FormName.zjxje)=="") {
		alert("������[��ǰ��������]��");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "��ǰ��������"))) {
		return false;
	}
	if(	javaTrim(FormName.zhzjxje)=="") {
		alert("������[�ۺ���������]��");
		FormName.zhzjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zhzjxje, "�ۺ���������"))) {
		return false;
	}
	if(	javaTrim(FormName.zqwgzj)=="") {
		alert("������[��ǰ�깤���]��");
		FormName.zqwgzj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqwgzj, "��ǰ�깤���"))) {
		return false;
	}
	if(	javaTrim(FormName.zhwgzj)=="") {
		alert("������[�ۺ��깤���]��");
		FormName.zhwgzj.focus();
		return false;
	}
	if(!(isFloat(FormName.zhwgzj, "�ۺ��깤���"))) {
		return false;
	}
	if(	javaTrim(FormName.khsskze)=="") {
		alert("������[�ͻ�ʵ�տ��ܶ�]��");
		FormName.khsskze.focus();
		return false;
	}
	if(!(isFloat(FormName.khsskze, "�ͻ�ʵ�տ��ܶ�"))) {
		return false;
	}

	if(	javaTrim(FormName.glftd)=="") {
		alert("������[����ѱ���]��");
		FormName.glftd.focus();
		return false;
	}
	if(!(isFloat(FormName.glftd, "����ѱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.glf)=="") {
		alert("������[�����]��");
		FormName.glf.focus();
		return false;
	}
	if(!(isFloat(FormName.glf, "�����"))) {
		return false;
	}
	if(	javaTrim(FormName.gdjskze)=="") {
		alert("������[Ӧ������]��");
		FormName.gdjskze.focus();
		return false;
	}
	if(!(isFloat(FormName.gdjskze, "Ӧ������"))) {
		return false;
	}

	
	var glf=0;
	glf=<%=zhwgzj%>*FormName.glftd.value/100;//�ۺ��깤��ۡ�����ѱ���
	glf=round(glf,2);
	FormName.glf.value=glf;

	var gdjskze=0;//Ӧ������
	gdjskze=<%=zhwgzj%>-glf;//�ۺ��깤��ۡ�����ѱ���
	gdjskze=round(gdjskze,2);
	FormName.gdjskze.value=gdjskze;

	
	var wxj=0;//���ʱ���=Ӧ������*���ʱ���ٷֱ�
	wxj=FormName.htwgzj.value/100.0*FormName.wxjbfb.value;
	wxj=round(wxj,2);
	FormName.wxj.value=wxj;


	//���ۿ���Ŀ
	if(	javaTrim(FormName.clf)=="") {
		alert("������[���Ϸ�]��");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "���Ϸ�"))) {
		return false;
	}
	if(	javaTrim(FormName.bzclfbl)=="") {
		alert("������[��׼���Ϸѱ���]��");
		FormName.bzclfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bzclfbl, "��׼���Ϸѱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.xbclk)=="") {
		alert("������[���Ͽۿ�]��");
		FormName.xbclk.focus();
		return false;
	}
	if(!(isFloat(FormName.xbclk, "���Ͽۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.psgjgff)=="") {
		alert("������[���͹��߹�����]��");
		FormName.psgjgff.focus();
		return false;
	}
	if(!(isFloat(FormName.psgjgff, "���͹��߹�����"))) {
		return false;
	}
	if(	javaTrim(FormName.ysf)=="") {
		alert("������[�����]��");
		FormName.ysf.focus();
		return false;
	}
	if(!(isFloat(FormName.ysf, "�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wxjbfb)=="") {
		alert("������[���ʱ���ٷֱ�]��");
		FormName.wxjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.wxjbfb, "���ʱ���ٷֱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.wxj)=="") {
		alert("������[���ʱ���]��");
		FormName.wxj.focus();
		return false;
	}
	if(!(isFloat(FormName.wxj, "���ʱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.gcjxkk)=="") {
		alert("������[���̼���ۿ�]��");
		FormName.gcjxkk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjxkk, "���̼���ۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.sj)=="") {
		alert("������[˰��]��");
		FormName.sj.focus();
		return false;
	}
	if(!(isFloat(FormName.sj, "˰��"))) {
		return false;
	}
	if(	javaTrim(FormName.lbcb)=="") {
		alert("������[����ɱ�]��");
		FormName.lbcb.focus();
		return false;
	}
	if(!(isFloat(FormName.lbcb, "����ɱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.kqtk)=="") {
		alert("������[�����ۿ�]��");
		FormName.kqtk.focus();
		return false;
	}
	if(!(isFloat(FormName.kqtk, "�����ۿ�"))) {
		return false;
	}
	

	
	//������
	if(	javaTrim(FormName.jkje)=="") {
		alert("������[ǰ���Ѳ�����]��");
		FormName.jkje.focus();
		return false;
	}
	if(!(isFloat(FormName.jkje, "ǰ���Ѳ�����"))) {
		return false;
	}

	
	var sqgz=0;//Ӧ������
	//Ӧ������=Ӧ������-���Ϸ�-���Ͽۿ�-���͹��߹�����-�����   -���ʱ���-���̼���ۿ�-˰��-����ɱ�-�����ۿ�-ǰ���Ѳ�����
	sqgz=FormName.gdjskze.value-FormName.clf.value*1.0-FormName.xbclk.value-FormName.psgjgff.value-FormName.ysf.value;
	sqgz=sqgz-FormName.wxj.value-FormName.gcjxkk.value-FormName.sj.value-FormName.lbcb.value-FormName.kqtk.value-FormName.jkje.value;
	sqgz=round(sqgz,2);
	FormName.sqgz.value=sqgz;

}


function f_do(FormName)//����FormName:Form������
{
	//��������
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.khlx)=="") {
		alert("��ѡ��[�ͻ�����]��");
		FormName.khlx.focus();
		return false;
	}
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("��ѡ��[�μӴ����]��");
		FormName.cxhdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("������[�ۿ���]��");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "�ۿ���"))) {
		return false;
	}
	if (FormName.zkl.value<0 || FormName.zkl.value>10)
	{
		alert("����[�ۿ���]Ӧ����0��10֮�䣡");
		FormName.zkl.select();
		return false;
	}

	if(	javaTrim(FormName.wdzgce)=="") {
		alert("������[����ԭ����]��");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "����ԭ����"))) {
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("������[����ǩԼ��]��");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "����ǩԼ��"))) {
		return false;
	}

	if(	javaTrim(FormName.zjxje)=="") {
		alert("������[��ǰ��������]��");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "��ǰ��������"))) {
		return false;
	}
	if(	javaTrim(FormName.zhzjxje)=="") {
		alert("������[�ۺ���������]��");
		FormName.zhzjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zhzjxje, "�ۺ���������"))) {
		return false;
	}
	if(	javaTrim(FormName.zqwgzj)=="") {
		alert("������[��ǰ�깤���]��");
		FormName.zqwgzj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqwgzj, "��ǰ�깤���"))) {
		return false;
	}
	if(	javaTrim(FormName.zhwgzj)=="") {
		alert("������[�ۺ��깤���]��");
		FormName.zhwgzj.focus();
		return false;
	}
	if(!(isFloat(FormName.zhwgzj, "�ۺ��깤���"))) {
		return false;
	}
	if(	javaTrim(FormName.khsskze)=="") {
		alert("������[�ͻ�ʵ�տ��ܶ�]��");
		FormName.khsskze.focus();
		return false;
	}
	if(!(isFloat(FormName.khsskze, "�ͻ�ʵ�տ��ܶ�"))) {
		return false;
	}

	if(	javaTrim(FormName.glftd)=="") {
		alert("������[����ѱ���]��");
		FormName.glftd.focus();
		return false;
	}
	if(!(isFloat(FormName.glftd, "����ѱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.glf)=="") {
		alert("������[�����]��");
		FormName.glf.focus();
		return false;
	}
	if(!(isFloat(FormName.glf, "�����"))) {
		return false;
	}
	if(	javaTrim(FormName.gdjskze)=="") {
		alert("������[Ӧ������]��");
		FormName.gdjskze.focus();
		return false;
	}
	if(!(isFloat(FormName.gdjskze, "Ӧ������"))) {
		return false;
	}

	//���ۿ���Ŀ
	if(	javaTrim(FormName.clf)=="") {
		alert("������[���Ϸ�]��");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "���Ϸ�"))) {
		return false;
	}
	if(	javaTrim(FormName.bzclfbl)=="") {
		alert("������[��׼���Ϸѱ���]��");
		FormName.bzclfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bzclfbl, "��׼���Ϸѱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.xbclk)=="") {
		alert("������[���Ͽۿ�]��");
		FormName.xbclk.focus();
		return false;
	}
	if(!(isFloat(FormName.xbclk, "���Ͽۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.psgjgff)=="") {
		alert("������[���͹��߹�����]��");
		FormName.psgjgff.focus();
		return false;
	}
	if(!(isFloat(FormName.psgjgff, "���͹��߹�����"))) {
		return false;
	}
	if(	javaTrim(FormName.ysf)=="") {
		alert("������[�����]��");
		FormName.ysf.focus();
		return false;
	}
	if(!(isFloat(FormName.ysf, "�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wxjbfb)=="") {
		alert("������[���ʱ���ٷֱ�]��");
		FormName.wxjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.wxjbfb, "���ʱ���ٷֱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.wxj)=="") {
		alert("������[���ʱ���]��");
		FormName.wxj.focus();
		return false;
	}
	if(!(isFloat(FormName.wxj, "���ʱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.gcjxkk)=="") {
		alert("������[���̼���ۿ�]��");
		FormName.gcjxkk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjxkk, "���̼���ۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.sj)=="") {
		alert("������[˰��]��");
		FormName.sj.focus();
		return false;
	}
	if(!(isFloat(FormName.sj, "˰��"))) {
		return false;
	}
	if(	javaTrim(FormName.lbcb)=="") {
		alert("������[����ɱ�]��");
		FormName.lbcb.focus();
		return false;
	}
	if(!(isFloat(FormName.lbcb, "����ɱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.kqtk)=="") {
		alert("������[�����ۿ�]��");
		FormName.kqtk.focus();
		return false;
	}
	if(!(isFloat(FormName.kqtk, "�����ۿ�"))) {
		return false;
	}
	
	
	//������
	if(	javaTrim(FormName.jkje)=="") {
		alert("������[ǰ���Ѳ�����]��");
		FormName.jkje.focus();
		return false;
	}
	if(!(isFloat(FormName.jkje, "ǰ���Ѳ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sqgz)=="") {
		alert("������[Ӧ������]��");
		FormName.sqgz.focus();
		return false;
	}
	if(!(isFloat(FormName.sqgz, "Ӧ������"))) {
		return false;
	}
	if(	javaTrim(FormName.gczxjl)=="") {
		alert("������[���������]��");
		FormName.gczxjl.focus();
		return false;
	}
	if(!(isFloat(FormName.gczxjl, "���������"))) {
		return false;
	}
	if(	javaTrim(FormName.ycfbk)=="") {
		alert("������[Զ�̷Ѳ���]��");
		FormName.ycfbk.focus();
		return false;
	}
	if(!(isFloat(FormName.ycfbk, "Զ�̷Ѳ���"))) {
		return false;
	}



	if(	javaTrim(FormName.jsr)=="") {
		alert("������[������]��");
		FormName.jsr.focus();
		return false;
	}
	if(	javaTrim(FormName.jssj)=="") {
		alert("������[����ʱ��]��");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jslx)=="") {
		alert("��ѡ��[��������]��");
		FormName.jslx.focus();
		return false;
	}
	if(	javaTrim(FormName.jsdw)=="") {
		alert("��ѡ��[���㵥λ]��");
		FormName.jsdw.focus();
		return false;
	}
	
	f_jsglf(FormName);

	FormName.action="SaveEditWgCw_gdjsjl.jsp";
	FormName.submit();
	FormName.dejs.disabled=false;
	return true;
}

//-->
</SCRIPT>
