<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String khjskze=null;
String khsskze=null;
String sjcb=null;
String sj=null;
String tdjs=null;
String sptdjs=null;
String glftd=null;
String glf=null;
String clf=null;
String zgclf=null;
String jkje=null;
String kwxf=null;
String spgckk=null;
String ksdf=null;
String kqtk=null;
String bk=null;
String bz=null;
String zjxxh=null;
double tdjsje=0;

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
String sgd=null;
String zjxm=null;
String jzbz=null;
double qye=0;
double wdzgce=0;
double xjqye=0;

double zhzjxje=0;
double zjxje=0;
double sfke=0;
double zkl=0;
//double bk=0;

double hbssk=0;//������Ŀʵ�տ�

String sjsfy=null;
String sgdfy=null;
String zjfy=null;
String gsfy=null;
String qtfy=null;
String gckk=null;
String jsr=null;
String jssj=null;
String jsfs =null;
double sgdfk=0;
double sjsfk=0;
double dejsje=0;
double xbclk=0;
double cbje=0;
double sgdglftd =0;
double gdjskze=0;


String spr=null;
String spsj=null;
String spjl=null;
String spyj=null;
double wxj=0;//ά�޽�
double wxjbfb=0;//ά�޽�

String gdjsjlh=cf.GB2Uni(request.getParameter("gdjsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select wxjbfb,wxj,spr,spsj,spjl,spyj,khbh,khjskze,khsskze,sjcb,sj,tdjs,glftd,glf,clf,zgclf,jkje,kwxf,ksdf,kqtk,bk,bz,tdjsje,gckk,sjsfy,sgdfy,zjfy,gsfy,qtfy,cbje,sgdglftd,gdjskze  ";
	ls_sql+=" ,jsr,jssj,sgdfk,sjsfk,dejsje,xbclk,jsfs";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where  (gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wxjbfb=rs.getDouble("wxjbfb");
		wxj=rs.getDouble("wxj");
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spjl=cf.fillNull(rs.getString("spjl"));
		spyj=cf.fillNull(rs.getString("spyj"));

		jsr=cf.fillNull(rs.getString("jsr"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		sgdfk=rs.getDouble("sgdfk");
		sjsfk=rs.getDouble("sjsfk");
		dejsje=rs.getDouble("dejsje");
		xbclk=rs.getDouble("xbclk");
		jsfs=cf.fillNull(rs.getString("jsfs"));

		
		khbh=cf.fillNull(rs.getString("khbh"));
		khjskze=cf.fillNull(rs.getString("khjskze"));
		khsskze=cf.fillNull(rs.getString("khsskze"));
		sjcb=cf.fillNull(rs.getString("sjcb"));
		sj=cf.fillNull(rs.getString("sj"));
		tdjs=cf.fillNull(rs.getString("tdjs"));
		glftd=cf.fillNull(rs.getString("glftd"));
		glf=cf.fillNull(rs.getString("glf"));
		clf=cf.fillNull(rs.getString("clf"));
		zgclf=cf.fillNull(rs.getString("zgclf"));
		jkje=cf.fillNull(rs.getString("jkje"));
		kwxf=cf.fillNull(rs.getString("kwxf"));
		ksdf=cf.fillNull(rs.getString("ksdf"));
		kqtk=cf.fillNull(rs.getString("kqtk"));
		//bk=cf.fillNull(rs.getDouble("bk"));
		bk=cf.fillNull(rs.getString("bk"));
		bz=cf.fillNull(rs.getString("bz"));
		tdjsje=rs.getDouble("tdjsje");
		sjsfy=cf.fillNull(rs.getString("sjsfy"));
		sgdfy=cf.fillNull(rs.getString("sgdfy"));
		zjfy=cf.fillNull(rs.getString("zjfy"));
		gsfy=cf.fillNull(rs.getString("gsfy"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		gckk=cf.fillNull(rs.getString("gckk"));
		cbje=rs.getDouble("cbje");
		sgdglftd=rs.getDouble("sgdglftd");
		gdjskze=rs.getDouble("gdjskze");
	}
	rs.close();
	ps.close();
	if (bk.equals(""))
	{
		bk="0";
	}
	
	ls_sql="select zjxxh,zhzjxje,zkl,zjxje,sfke,khxm,fwdz,lxfs,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,jzbz,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		zhzjxje=rs.getDouble("zhzjxje");
		zkl=rs.getDouble("zkl");
		zjxje=rs.getDouble("zjxje");
		sfke=rs.getDouble("sfke");
		qye=rs.getDouble("qye");
		wdzgce=rs.getDouble("wdzgce");

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

	if (jzbz.equals(""))
	{
		jzbz="1";
	}

	if (jsfs.equals("1"))//1���������ѣ�2���������
	{
		wxj=((int)(tdjsje*0.03*100+0.5))/100.0;
	}
	else{
		wxj=((int)(dejsje*0.03*100+0.5))/100.0;
	}

	//������Ŀ
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='92' and scbz='N'";//92��������Ŀ
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hbssk=rs.getDouble(1);//���ջ�����Ŀ��
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and zffs='31' and zckx='92' and scbz='N'";//ת��������Ŀ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hbssk=hbssk-rs.getDouble(1);
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

<html>
<head>
<title>���ӽ���-����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���ӽ���-�����������¼�ţ�<%=gdjsjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveSpCw_gdjsjl.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">�ͻ����</td>
              <td width="30%"><%=khbh%></td>
              <td align="right" width="21%">��ͬ��</td>
              <td width="29%"><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="30%"><%=khxm%> </td>
              <td width="21%"> 
                <div align="right">�ʼ�����</div>
              </td>
              <td width="29%"><%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">���ݵ�ַ</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="30%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="21%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="29%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">ǩԼ����</td>
              <td width="30%"><%=qyrq%></td>
              <td align="right" width="21%">ʵ���������</td>
              <td width="29%"><%=sjwjrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">��ͬ��������</td>
              <td width="30%"><%=kgrq%></td>
              <td align="right" width="21%">��ͬ��������</td>
              <td width="29%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">ʵ�ʿ�������</td>
              <td width="30%"><%=sjkgrq%></td>
              <td align="right" width="21%">ʵ�ʿ�������</td>
              <td width="29%"><%=sjjgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">ʩ����</font></td>
              <td width="30%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%> 
                </select>
              </td>
              <td align="right" width="21%"><font color="#0000FF">��װ��־</font></td>
              <td width="29%"> 
                <select name="jzbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectToken(out,"1+��װ&2+��װ",jzbz,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">��װǩԼ��</font></td>
              <td width="30%"> 
                <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="21%"><font color="#0000FF">����ԭ����</font></td>
              <td width="29%"> 
                <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">�ۺ��ۼ�������</font></td>
              <td width="30%"> 
                <input type="text" name="zhzjxje" value="<%=zhzjxje%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="21%"><font color="#0000FF">��ǰ�ۼ�������</font></td>
              <td width="29%"><%=zjxje %></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">����ʵ�ʷ�����</font></td>
              <td width="30%"><%=(qye+zhzjxje  )%>��<font color="#0000FF">ǩԼ��</font>��<font color="#0000FF">�ۺ�������</font>�� 
              </td>
              <td align="right" width="21%"><font color="#0000FF">����ʵ�տ��ܶ�</font></td>
              <td width="29%"> 
                <input type="text" name="khsskze" value="<%=sfke%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">�ۿ���</font></td>
              <td width="30%"> 
                <input type="text" name="zkl" value="<%=zkl%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="21%">&nbsp;</td>
              <td width="29%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td height="3" colspan="4" align="center" bgcolor="#FFFFCC">������Ϣ</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#FF0000">*</font>���㷽ʽ</td>
              <td width="30%"><%
	cf.radioToken(out, "jsfs","1+��������&2+�������",jsfs);
%></td>
              <td align="right" width="21%">�ͻ�������</td>
              <td width="29%"> 
                <input type="text" name="khjskze" value="<%=khjskze%>" size="20" maxlength="17" onChange="f_jsglf(editform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">������</div>
              </td>
              <td width="30%"> 
                <select name="tdjs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f_jsglf(editform)">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+�ͻ�������&2+ʵ�տ�&3+ǩԼ��&4+ʵ�ʳɱ�&9+����",tdjs);
%> 
                </select>
              </td>
              <td width="21%"> 
                <div align="right">���������</div>
              </td>
              <td width="29%"> 
                <input type="text" name="tdjsje" size="20" maxlength="17"  value="<%=tdjsje%>" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF" align="center"> 
              <td colspan="4"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">ʩ���ӳе����̿ۿ�</td>
              <td width="30%"> 
                <input type="text" name="sgdfy" size="20" maxlength="17"  value="<%=sgdfy%>" onChange="f_gckk(editform)">
              </td>
              <td width="21%" align="right">���ʦ�е����̿ۿ�</td>
              <td width="29%"> 
                <input type="text" name="sjsfy" size="20" maxlength="17"  value="<%=sjsfy%>" onChange="f_gckk(editform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�ʼ�е����̿ۿ�</div>
              </td>
              <td width="30%"> 
                <input type="text" name="zjfy" size="20" maxlength="17"  value="<%=zjfy%>" onChange="f_gckk(editform)">
              </td>
              <td width="21%"> 
                <div align="right">��˾�е����̿ۿ�</div>
              </td>
              <td width="29%"> 
                <input type="text" name="gsfy" size="20" maxlength="17"  value="<%=gsfy%>" onChange="f_gckk(editform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�������е����̿ۿ�</div>
              </td>
              <td width="30%"> 
                <input type="text" name="qtfy" size="20" maxlength="17"  value="<%=qtfy%>" onChange="f_gckk(editform)">
              </td>
              <td width="21%"> 
                <div align="right"><font color="#0000CC">���̿ۿ�</font></div>
              </td>
              <td width="29%"> 
                <input type="text" name="gckk" value="<%=gckk%>" size="20" maxlength="17" onChange="f_gckk(editform)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF" align="center"> 
              <td colspan="4"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">ʩ���ӷ���</td>
              <td width="30%"> 
                <input type="text" name="sgdfk" value="<%=sgdfk%>" size="20" maxlength="17" >
              </td>
              <td align="right" width="21%">���ʦ����</td>
              <td width="29%"> 
                <input type="text" name="sjsfk" value="<%=sjsfk%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#990000">���۽��</font> </td>
              <td><input type="text" name="cbje" value="<%=cbje%>" size="20" maxlength="17" onChange="calValue(editform)"></td>
              <td align="right"><font color="#993300">ʩ���ӹ������</font></td>
              <td>                  <font color="#993300">
<input type="text" name="sgdglftd" value="<%=sgdglftd%>" size="8" maxlength="8" onChange="calValue(editform)">              
%</font><font color="#990000">(����������</font><font color="#993300">��</font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#993300">ʩ���ӽ����ܽ��</font> </td>
              <td><input type="text" name="gdjskze" value="<%=gdjskze%>" size="20" maxlength="17" readonly></td>
              <td align="right" bgcolor="#FFFFCC"><font color="#993300">ʩ���ӽ������</font></td>
              <td bgcolor="#FFFFCC"><input type="text" name="jsglftd" value="" size="8" maxlength="8" >
                  <font color="#993300">%</font><font color="#990000">(ϵͳ�Զ����㣩 </font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000CC">���������</font></td>
              <td width="30%"><%=dejsje%></td>
              <td width="21%" align="right"><font color="#0000CC">�貹���Ͽ�</font></td>
              <td width="29%"><%=xbclk%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">������</td>
              <td width="30%"><%=jsr%></td>
              <td width="21%" align="right">����ʱ��</td>
              <td width="29%"><%=jssj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF" width="20%">��ע</td>
              <td colspan="3" bgcolor="#E8E8FF"><%=bz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td height="2" colspan="4" align="center" bgcolor="#FFFFCC">������Ϣ</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC" width="20%">��������</td>
              <td bgcolor="#FFFFCC" width="30%"> 
<input type="text" name="glftd" size="10" maxlength="17"  value="<%=glftd%>"  >                
% </td>
              <td align="right" bgcolor="#FFFFCC" width="21%">����</td>
              <td bgcolor="#FFFFCC" width="29%"> 
                <input type="text" name="bk" size="20" maxlength="17"  value="<%=bk%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC" width="20%">ά�޽�ٷֱ�</td>
              <td bgcolor="#FFFFCC" width="30%"> 
                <input name="wxjbfb" type="text" onChange="f_wxj(editform)"  value="<%=wxjbfb%>" size="10" maxlength="17">
                % </td>
              <td align="right" bgcolor="#FFFFCC" width="21%">ά�޽�</td>
              <td bgcolor="#FFFFCC" width="29%"> 
                <input type="text" name="wxj" size="20" maxlength="17"  value="<%=wxj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC" width="20%">��������</td>
              <td bgcolor="#FFFFCC" width="30%"> 
<%
	cf.radioToken(out, "spjl","3+ͬ��&4+��ͬ��",spjl);
%>
              </td>
              <td bgcolor="#FFFFCC" width="21%">&nbsp;</td>
              <td bgcolor="#FFFFCC" width="29%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td bgcolor="#FFFFCC" width="20%"> 
                <div align="right">������</div>
              </td>
              <td bgcolor="#FFFFCC" width="30%"> 
                <input type="text" name="spr" size="20" maxlength="20"  value="<%=spr%>" readonly>
              </td>
              <td bgcolor="#FFFFCC" width="21%"> 
                <div align="right">����ʱ��</div>
              </td>
              <td bgcolor="#FFFFCC" width="29%"> 
                <input type="text" name="spsj" size="20" maxlength="10"  value="<%=spsj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC" width="20%">�������</td>
              <td colspan="3" bgcolor="#FFFFCC"> 
                <textarea name="spyj" cols="71" rows="3"><%=spyj%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" > 
                <div align="center"> 
                  <p> 
                  <input type="hidden" name="gdjsjlh"  value="<%=gdjsjlh%>" >
                    <input type="hidden" name="hbssk" value="<%=hbssk%>" size="20" maxlength="17" readonly>
                    <input type="hidden" name="sjcb" value="<%=sjcb%>" size="20" maxlength="17" onChange="f_jsglf(insertform)">
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                    <input name="button3" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="�ͻ��տ���Ϣ">
                    <input name="dejs" type="button" onClick="window.open('dejs.jsp?khbh=<%=khbh%>&gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')" value="�������">
                    <input name="tjsbl" type="button" value="�����������" onClick="window.open('EditCw_dejsmx.jsp?khbh=<%=khbh%>&gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                   </p>
                  <p> 
                    <input type="button" value="�鿴���������" onClick="window.open('ViewCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                    <input type="button" value="��ӡ������㵥(�ӳ�)" onClick="window.open('DySgdCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                    <input type="button" value="��ӡ������㵥(�ڲ�)" onClick="window.open('DyGSCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                  </p>
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
function f_jsglf(FormName)//����FormName:Form������
{
	if (FormName.tdjs.value=='1')//1���ͻ������2��ʵ�տ3��ǩԼ� 4��ʵ�ʳɱ���5����������9������
	{
		FormName.tdjsje.value=FormName.khjskze.value;
	}
	else if (FormName.tdjs.value=='2')
	{
		FormName.tdjsje.value=<%=(sfke)%>;
	}
	else if (FormName.tdjs.value=='3')
	{
		FormName.tdjsje.value=<%=qye%>;
	}
	else if (FormName.tdjs.value=='4')
	{
		FormName.tdjsje.value=FormName.sjcb.value;
	}
	else if (FormName.tdjs.value=='9')
	{
	}

	if (FormName.jsfs[0].checked)
	{
		FormName.wxj.value=round(FormName.tdjsje.value*FormName.wxjbfb.value/100.0,2);
	}
	else{
		FormName.wxj.value=round(<%=dejsje%>*FormName.wxjbfb.value/100.0,2);
	}

}

function f_gckk(FormName)//����FormName:Form������
{
	var gk=FormName.sjsfy.value*1.0+FormName.sgdfy.value*1.0+FormName.zjfy.value*1.0+FormName.gsfy.value*1.0+FormName.qtfy.value*1.0;
	gk=parseInt(gk*100.0+0.5)/100.0;
	FormName.gckk.value=gk;
}
function calValue(FormName)
{  
	
	var gdjskze=FormName.cbje.value*(FormName.sgdglftd.value/100.0)+FormName.cbje.value*1.00;
	gdjskze=round(gdjskze,2);
	var tdjsje=FormName.tdjsje.value*1.0;
	jsglftd=1*((gdjskze*100.0)/tdjsje);
	jsglftd=round(jsglftd,2);
	FormName.gdjskze.value=gdjskze;
	FormName.jsglftd.value=jsglftd ; 
	FormName.glftd.value=round((100-FormName.jsglftd.value),2); 	
}    
function f_wxj(FormName)//����FormName:Form������
{
	if (FormName.jsfs[0].checked)
	{
		FormName.wxj.value=round(FormName.tdjsje.value*FormName.wxjbfb.value/100.0,2);
	}
	else{
		FormName.wxj.value=round(<%=dejsje%>*FormName.wxjbfb.value/100.0,2);
	}
}
function f_do(FormName)//����FormName:Form������
{
//	f_jsglf(FormName);


	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.jzbz)=="") {
		alert("��ѡ��[��װ��־]��");
		FormName.jzbz.focus();
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
	if(	javaTrim(FormName.wdzgce)=="") {
		alert("������[����ԭ����]��");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "����ԭ����"))) {
		return false;
	}
	if(	javaTrim(FormName.zhzjxje)=="") {
		alert("������[�ۺ��ۼ�������]��");
		FormName.zhzjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zhzjxje, "�ۺ��ۼ�������"))) {
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

	if(	javaTrim(FormName.khsskze)=="") {
		alert("������[�ͻ�ʵ�տ��ܶ�]��");
		FormName.khsskze.focus();
		return false;
	}
	if(!(isFloat(FormName.khsskze, "�ͻ�ʵ�տ��ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.hbssk)=="") {
		alert("������[������Ŀʵ�տ�]��");
		FormName.hbssk.focus();
		return false;
	}
	if(!(isFloat(FormName.hbssk, "������Ŀʵ�տ�"))) {
		return false;
	}

	if(	!radioChecked(FormName.jsfs)) {
		alert("��ѡ��[���㷽ʽ]��");
		FormName.jsfs[0].focus();
		return false;
	}

	if(	javaTrim(FormName.khjskze)=="") {
		alert("������[�ͻ�������]��");
		FormName.khjskze.focus();
		return false;
	}
	if(!(isFloat(FormName.khjskze, "�ͻ�������"))) {
		return false;
	}

	if (FormName.jsfs[1].checked)
	{
		//FormName.glftd.value="0"; 
		if(	javaTrim(FormName.cbje)=="") {
			alert("������[���۽��]��");
			FormName.cbje.focus();
			return false;
		}
		if (FormName.cbje.value=="0")
		{
			alert("����[���ʽ����Ļ��۽��]����Ϊ0��");
			FormName.cbje.focus();
			return false;
		}
		if(!(isFloat(FormName.cbje, "���۽��"))) {
			return false;
		}
		if(	javaTrim(FormName.sgdglftd)=="") {
			alert("������[ʩ���ӹ������]��");
			FormName.sgdglftd.focus();
			return false;
		}
		if (FormName.sgdglftd.value=="0")
		{
			alert("����[���ʽ�����ʩ���ӹ������]����Ϊ0��");
			FormName.sgdglftd.focus();
			return false;
		}
		if (FormName.jsglftd.value<0 || FormName.jsglftd.value>=100)
		{
			alert("����[ʩ���ӽ����ܽ��]���ܸ���[�ͻ�������]��");
			FormName.gdjskze.select();
			return false;
		}
		if(!(isFloat(FormName.sgdglftd, "ʩ���ӹ������"))) {
			return false;
		}	
		
	}	
    if (FormName.jsfs[0].checked)
	{	
		FormName.cbje.value="0"; 
	    FormName.sgdglftd.value="0"; 
	    FormName.gdjskze.value="0"; 
	    FormName.jsglftd.value="0"; 
		if(	javaTrim(FormName.tdjs)=="") {
			alert("��ѡ��[������]��");
			FormName.tdjs.focus();
			return false;
		}
		if(	javaTrim(FormName.tdjsje)=="") {
			alert("������[���������]��");
			FormName.tdjsje.focus();
			return false;
		}
		if(!(isFloat(FormName.tdjsje, "���������"))) {
			return false;
		}
		if(	javaTrim(FormName.glftd)=="") {
			alert("������[����������]��");
			FormName.glftd.focus();
			return false;
		}
		if (FormName.glftd.value=="0")
		{
			alert("����[����������]����Ϊ0��");
			FormName.glftd.focus();
			return false;
		}
		if(!(isFloat(FormName.glftd, "����������"))) {
			return false;
		}
		if (FormName.glftd.value<0 || FormName.glftd.value>=100)
		{
			alert("����[����������]Ӧ����0��100֮�䣡");
			FormName.glftd.select();
			return false;
		}	
	}

	if(!(isFloat(FormName.sjcb, "ʵ�ʳɱ�"))) {
		return false;
	}

	if(	javaTrim(FormName.gckk)=="") {
		alert("������[���̿ۿ�]��");
		FormName.gckk.focus();
		return false;
	}
	if(!(isFloat(FormName.gckk, "���̿ۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsfy)=="") {
		alert("������[���ʦ�е�����]��");
		FormName.sjsfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsfy, "���ʦ�е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdfy)=="") {
		alert("������[ʩ���ӳе�����]��");
		FormName.sgdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfy, "ʩ���ӳе�����"))) {
		return false;
	}
	if(	javaTrim(FormName.zjfy)=="") {
		alert("������[�ʼ�е�����]��");
		FormName.zjfy.focus();
		return false;
	}
	if(!(isFloat(FormName.zjfy, "�ʼ�е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.gsfy)=="") {
		alert("������[��˾�е�����]��");
		FormName.gsfy.focus();
		return false;
	}
	if(!(isFloat(FormName.gsfy, "��˾�е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.qtfy)=="") {
		alert("������[�������е�����]��");
		FormName.qtfy.focus();
		return false;
	}
	if(!(isFloat(FormName.qtfy, "�������е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdfk)=="") {
		alert("������[ʩ���ӷ���]��");
		FormName.sgdfk.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfk, "ʩ���ӷ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsfk)=="") {
		alert("������[���ʦ����]��");
		FormName.sjsfk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsfk, "���ʦ����"))) {
		return false;
	}



	if (FormName.jsfs[0].checked)
	{
		if(	javaTrim(FormName.glftd)=="") {
			alert("������[��������]��");
			FormName.glftd.focus();
			return false;
		}
		if(!(isFloat(FormName.glftd, "��������"))) {
			return false;
		}
	}

	if(	javaTrim(FormName.wxjbfb)=="") {
		alert("������[ά�޽�ٷֱ�]��");
		FormName.wxjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.wxjbfb, "ά�޽�ٷֱ�"))) {
		return false;
	}

	if(	javaTrim(FormName.wxj)=="") {
		alert("������[ά�޽�]��");
		FormName.wxj.focus();
		return false;
	}
	if(!(isFloat(FormName.wxj, "ά�޽�"))) {
		return false;
	}
	if(	javaTrim(FormName.bk)=="") {
		alert("������[����]��");
		FormName.bk.focus();
		return false;
	}
	if(!(isFloat(FormName.bk, "����"))) {
		return false;
	}

	if(	!radioChecked(FormName.spjl)) {
		alert("��ѡ��[��������]��");
		FormName.spjl[0].focus();
		return false;
	}

	if (FormName.spjl[1].checked)
	{
		if(	javaTrim(FormName.spyj)=="") {
			alert("������[�������]��");
			FormName.spyj.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.spr)=="") {
		alert("������[������]��");
		FormName.spr.focus();
		return false;
	}
	if(	javaTrim(FormName.spsj)=="") {
		alert("������[����ʱ��]��");
		FormName.spsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.spsj, "����ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}

//-->
</SCRIPT>
