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
String tdjs=null;
String sptdjs=null;
String spgckk=null;
String bz=null;
double tdjsje=0;
double glftd=0;

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
String zjxxh=null;

double zhzjxje=0;
double zjxje=0;
double sfke=0;
double zkl=0;
double bk=0;

double hbssk=0;//������Ŀʵ�տ�

String sjsfy=null;
double sgdfy=0;
String zjfy=null;
String gsfy=null;
String qtfy=null;
String gckk=null;

String spr=null;
String spsj=null;
String spjl=null;
String spyj=null;

double dejsje=0;

String jsfs=null;
double sgdfk=0;
double sjsfk=0;
double xbclk=0;
String jsr=null;
String jssj=null;


double glf=0;
double clf=0;//�������Ϸ�
double zgclf=0;//�Թ����Ϸ�
double sj=0;
double ksdf=0;
double gdjskze=0;

double wxj=0;//ά�޽�
double wxjbfb=0;//ά�޽�
double kwxf=0;
double jkje=0;
double fakuan=0;
double kqtk=0;//�����ۿ�
double sqgz=0;

String cwjsr=null;
String cwjssj=null;
String cwjssm=null;

String gdjsjlh=cf.GB2Uni(request.getParameter("gdjsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jsfs,sgdfk,sjsfk,xbclk,jsr,jssj,dejsje,spr,spsj,spjl,spyj,khbh,sgd,khjskze,khsskze,sjcb,tdjs,glftd,ksdf,bk,bz,tdjsje,gckk,sjsfy,sgdfy,zjfy,gsfy,qtfy ";
	ls_sql+=" ,glf,sj,clf,zgclf,gdjskze   ,wxjbfb,wxj,kwxf,jkje,fakuan,kqtk,sqgz,cwjsr,cwjssj,cwjssm";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where  (gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{

		glf=rs.getDouble("glf");
		sj=rs.getDouble("sj");
		clf=rs.getDouble("clf");
		zgclf=rs.getDouble("zgclf");
		gdjskze=rs.getDouble("gdjskze");

		wxjbfb=rs.getDouble("wxjbfb");
		wxj=rs.getDouble("wxj");
		kwxf=rs.getDouble("kwxf");
		jkje=rs.getDouble("jkje");
		fakuan=rs.getDouble("fakuan");
		kqtk=rs.getDouble("kqtk");
		sqgz=rs.getDouble("sqgz");

		cwjsr=cf.fillNull(rs.getString("cwjsr"));
		cwjssj=cf.fillNull(rs.getDate("cwjssj"));
		cwjssm=cf.fillNull(rs.getString("cwjssm"));
		
		
		jsfs=cf.fillNull(rs.getString("jsfs"));
		sgdfk=rs.getDouble("sgdfk");
		sjsfk=rs.getDouble("sjsfk");
		xbclk=rs.getDouble("xbclk");
		jsr=cf.fillNull(rs.getString("jsr"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		sgd=cf.fillNull(rs.getString("sgd"));

		
		dejsje=rs.getDouble("dejsje");
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spjl=cf.fillNull(rs.getString("spjl"));
		spyj=cf.fillNull(rs.getString("spyj"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khjskze=cf.fillNull(rs.getString("khjskze"));
		khsskze=cf.fillNull(rs.getString("khsskze"));
		sjcb=cf.fillNull(rs.getString("sjcb"));
		tdjs=cf.fillNull(rs.getString("tdjs"));
		glftd=rs.getDouble("glftd");
		ksdf=rs.getDouble("ksdf");
		bk=rs.getDouble("bk");
		bz=cf.fillNull(rs.getString("bz"));
		tdjsje=rs.getDouble("tdjsje");
		sjsfy=cf.fillNull(rs.getString("sjsfy"));
		sgdfy=rs.getDouble("sgdfy");
		zjfy=cf.fillNull(rs.getString("zjfy"));
		gsfy=cf.fillNull(rs.getString("gsfy"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		gckk=cf.fillNull(rs.getString("gckk"));
	}
	rs.close();
	ps.close();

	
	ls_sql="select zjxxh,zkl,zhzjxje,zjxje,sfke,khxm,fwdz,lxfs,sjs,hth,qyrq,dwbh,zjxm,wdzgce,qye,jzbz,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		zkl=rs.getDouble("zkl");
		zhzjxje=rs.getDouble("zhzjxje");
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
		zjxm=cf.fillNull(rs.getString("zjxm"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

	}
	rs.close();
	ps.close();




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

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">ʩ���ӽ���--<strong>�������</strong> �������¼�ţ�<%=gdjsjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">
<form method="post" action="" name="insertform" target="_blank">
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
              <td width="30%"> <%=(qye+zhzjxje  )%>��<font color="#0000FF">ǩԼ��</font>��<font color="#0000FF">�ۺ�������</font>��</td>
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
            <tr bgcolor="#E8E8FF"> 
              <td height="2" colspan="4" align="center">������Ϣ</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%">���㷽ʽ</td>
              <td width="30%"><%
	cf.radioToken(out, "jsfs","1+��������&2+�������",jsfs,true);
%></td>
              <td align="right" width="21%">�ͻ�������</td>
              <td width="29%"> 
                <input type="text" name="khjskze" value="<%=khjskze%>" size="20" maxlength="17" onChange="f_jsglf(editform)" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%"> 
                <div align="right">������</div>
              </td>
              <td width="30%"> 
                <select name="tdjs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f_jsglf(editform)">
                  <%
	cf.selectToken(out,"1+�ͻ�������&2+ʵ�տ�&3+ǩԼ��&4+ʵ�ʳɱ�&9+����",tdjs,false);
%> 
                </select>
              </td>
              <td width="21%"> 
                <div align="right">���������</div>
              </td>
              <td width="29%"> 
                <input type="text" name="tdjsje" size="20" maxlength="17"  value="<%=tdjsje%>" onChange="f_jsk(insertform)" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td colspan="4"></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%" align="right">ʩ���ӳе����̿ۿ�</td>
              <td width="30%"> 
                <input type="text" name="sgdfy" size="20" maxlength="17"  value="<%=sgdfy%>" readonly>
              </td>
              <td width="21%" align="right">���ʦ�е����̿ۿ�</td>
              <td width="29%"> 
                <input type="text" name="sjsfy" size="20" maxlength="17"  value="<%=sjsfy%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%"> 
                <div align="right">�ʼ�е����̿ۿ�</div>
              </td>
              <td width="30%"> 
                <input type="text" name="zjfy" size="20" maxlength="17"  value="<%=zjfy%>" readonly>
              </td>
              <td width="21%"> 
                <div align="right">��˾�е����̿ۿ�</div>
              </td>
              <td width="29%"> 
                <input type="text" name="gsfy" size="20" maxlength="17"  value="<%=gsfy%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%"> 
                <div align="right">�������е����̿ۿ�</div>
              </td>
              <td width="30%"> 
                <input type="text" name="qtfy" size="20" maxlength="17"  value="<%=qtfy%>" readonly>
              </td>
              <td width="21%"> 
                <div align="right">���̿ۿ�</div>
              </td>
              <td width="29%"> 
                <input type="text" name="gckk" value="<%=gckk%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td colspan="4"></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%">ʩ���ӷ���</td>
              <td width="30%"> 
                <input type="text" name="sgdfk" value="<%=sgdfk%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="21%">���ʦ����</td>
              <td width="29%"> 
                <input type="text" name="sjsfk" value="<%=sjsfk%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%">���������</td>
              <td width="30%"> 
                <input type="text" name="dejsje" value="<%=dejsje%>" size="20" maxlength="17" readonly>
              </td>
              <td width="21%" align="right">�貹���Ͽ�</td>
              <td width="29%"> 
                <input type="text" name="xbclk" value="<%=xbclk%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
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
                <input type="text" name="glftd" size="10" maxlength="17"  value="<%=glftd%>" onChange="f_jsk(insertform)" readonly>
                % </td>
              <td align="right" bgcolor="#FFFFCC" width="21%">�����</td>
              <td bgcolor="#FFFFCC" width="29%"> 
                <input type="text" name="glf" size="20" maxlength="17"  value="<%=glf%>" onChange="f_jsk(insertform)" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC" width="20%">��������</td>
              <td bgcolor="#FFFFCC" width="30%"> <%
	cf.radioToken(out, "spjl","3+ͬ��&4+��ͬ��",spjl,true);
%> </td>
              <td bgcolor="#FFFFCC" width="21%" align="right">����</td>
              <td bgcolor="#FFFFCC" width="29%"> 
                <input type="text" name="bk" size="20" maxlength="17"  value="<%=bk%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td bgcolor="#FFFFCC" width="20%"> 
                <div align="right">������</div>
              </td>
              <td bgcolor="#FFFFCC" width="30%"> <%=spr%> </td>
              <td bgcolor="#FFFFCC" width="21%"> 
                <div align="right">����ʱ��</div>
              </td>
              <td bgcolor="#FFFFCC" width="29%"> <%=spsj%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC" width="20%">�������</td>
              <td colspan="3" bgcolor="#FFFFCC"> <%=spyj%> </td>
            </tr>
            <tr bgcolor="#FFFFFF" align="center"> 
              <td colspan="4">������� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">�������Ϸ�</td>
              <td width="30%" bgcolor="#FFFFFF"> 
                <input type="text" name="clf" value="<%=clf%>" size="20" maxlength="9" onchange="f_gdjskze(insertform)">
              </td>
              <td align="right" width="21%">�Թ����Ϸ�</td>
              <td width="29%"> 
                <input name="zgclf" type="text" id="zgclf" value="<%=zgclf%>" size="20" maxlength="9" onchange="f_gdjskze(insertform)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">˰��</td>
              <td width="30%"> 
                <input type="text" name="sj" value="<%=sj%>" size="20" maxlength="17" onChange="f_jsk(insertform)">
              </td>
              <td align="right" width="21%">��ˮ���</td>
              <td width="29%"> 
                <input name="ksdf" type="text" id="ksdf" value="<%=ksdf%>" size="20" maxlength="17" onchange="f_gdjskze(insertform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><b><font color="#FF0000">*</font><font color="#0000FF">���ӽ�����ܶ�</font></b></td>
              <td width="30%"> 
                <input type="text" name="gdjskze" value="<%=gdjskze%>" size="20" maxlength="9" readonly>
              </td>
              <td align="right" width="21%">&nbsp;</td>
              <td width="29%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4"> <b>��������</b>��<font color="#0000FF">�����</font>��������������ѣ�˰�𣭲��Ϸѣ��Թ����Ϸѣ����̿ۿ��ˮ��ѣ����ʩ���ӷ��� 
                <br>
                <b>�� ��� ��</b>��<font color="#0000FF">�����</font>��&nbsp;&nbsp;&nbsp;&nbsp;��������˰�𣭲��Ϸѣ��Թ����Ϸѣ����̿ۿ��ˮ��ѣ����ʩ���ӷ��� 
                ���貹���Ͽ� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">ά�޽�ٷֱ�</font></td>
              <td width="30%"> 
                <input name="wxjbfb" type="text" onChange="f_wxj(editform)"  value="<%=wxjbfb%>" size="10" maxlength="17" readonly>
                % </td>
              <td align="right" width="21%"><font color="#0000FF">ά�޽�</font></td>
              <td width="29%"> 
                <input type="text" name="wxj" size="20" maxlength="17"  value="<%=wxj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">��ά�޷�</td>
              <td width="30%"> 
                <input type="text" name="kwxf" value="<%=kwxf%>" size="20" maxlength="17" onchange="f_sqgz(insertform)">
              </td>
              <td align="right" width="21%">�����</td>
              <td width="29%"> 
                <input type="text" name="jkje" value="<%=jkje%>" size="20" maxlength="17" onchange="f_sqgz(insertform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">������</td>
              <td width="30%"> 
                <input type="text" name="fakuan" value="<%=fakuan%>" size="20" maxlength="17" onchange="f_sqgz(insertform)">
              </td>
              <td align="right" width="21%">�����ۿ�</td>
              <td width="29%"> 
                <input type="text" name="kqtk" value="<%=kqtk%>" size="20" maxlength="17" onchange="f_sqgz(insertform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><b><font color="#FF0000">*</font><font color="#0000FF">˰ǰ����</font></b></td>
              <td width="30%"> 
                <input type="text" name="sqgz" value="<%=sqgz%>" size="20" maxlength="9" readonly>
              </td>
              <td width="21%">&nbsp;</td>
              <td width="29%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%">&nbsp;</td>
              <td colspan="3"><font color="#0000FF">˰ǰ����</font> = ���ӽ�����ܶά�޽�-��ά�޷ѣ�������������ۿ�</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#0000FF">���������</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="cwjsr" value="<%=cwjsr%>" size="20" maxlength="20" readonly>
              </td>
              <td width="21%"> 
                <div align="right"><font color="#0000FF">�������ʱ��</font></div>
              </td>
              <td width="29%"> 
                <input type="text" name="cwjssj" value="<%=cwjssj%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�������˵��</td>
              <td colspan="3"> 
                <textarea name="cwjssm" cols="71" rows="3"><%=cwjssm%></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <p> 
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="button" value="�鿴������Ϣ" onClick="window.open('/cwgl/sgdjs/ViewCw_gdjsjl.jsp?gdjsjlh=<%=gdjsjlh%>')" name="ck" >
                  <input type="button" value="��ӡ������㵥(�ӳ�)" onClick="window.open('DySgdCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                  <input type="button" value="��ӡ������㵥(�ڲ�)" onClick="window.open('DyGSCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                  <input type="reset"  value="����" name="reset">
                  <input type="hidden" name="khbh" value="<%=khbh%>" >
                  <input type="hidden" name="gdjsjlh" value="<%=gdjsjlh%>" >
                    <input type="hidden" name="hbssk" value="<%=hbssk%>" size="20" maxlength="17" readonly>
                    <input type="hidden" name="sjcb" value="<%=sjcb%>" size="20" maxlength="17" onChange="f_jsglf(insertform)">
                </p>
                <p> 
                  <input name="button2" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="�ͻ�������Ϣ">
                  <input type="button" onClick="window.open('/cwgl/sgdjs/JsWxjlList.jsp?sgd=<%=sgd%>&gdjsjlh=<%=gdjsjlh%>')" value="ά�޷�">
                  <input type="button" onClick="window.open('/cwgl/sgdjs/JsJkjlList.jsp?sgd=<%=sgd%>&gdjsjlh=<%=gdjsjlh%>')" value="����¼" name="button">
                  <input type="button" onClick="window.open('/cwgl/sgdjs/JsFkjlList.jsp?sgd=<%=sgd%>&gdjsjlh=<%=gdjsjlh%>')" value="����">
                  <input type="button" onClick="window.open('/cwgl/sgdjs/JsKqtkList.jsp?sgd=<%=sgd%>&gdjsjlh=<%=gdjsjlh%>')" value="�����ۿ�">
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
function f_jsk(FormName)//����FormName:Form������
{
	<%
	if (jzbz.equals("1"))
	{
		%>
		//��װ����ѣ�����������˰�𣩡���������
		FormName.glf.value=round(  (FormName.tdjsje.value*1.0-FormName.sj.value*1.0)*FormName.glftd.value/100.0  ,2);
		<%
	}
	else{
		%>
		//��װ����ѣ�����������������
		FormName.glf.value=round(  (FormName.tdjsje.value*1.0)*FormName.glftd.value/100.0  ,2);
		<%
	}
	%>

	f_gdjskze(FormName);
}
function f_gdjskze(FormName)//����FormName:Form������
{
	//�������ѣ�����������������ѣ�˰�𣭲��Ϸѣ��Թ����Ϸѣ����̿ۿ��ˮ��ѣ����ʩ���ӷ��� 
	//�� ��� �㣺����   ��������˰�𣭲��Ϸѣ��Թ����Ϸѣ����̿ۿ��ˮ��ѣ����ʩ���ӷ��� ���貹���Ͽ� 

	var gdjskze=0;
	if ("<%=jsfs%>"=="1")//1���������ѣ�2���������
	{
		gdjskze=FormName.tdjsje.value*1.0-FormName.glf.value*1.0-FormName.sj.value*1.0-FormName.clf.value*1.0-FormName.zgclf.value*1.0-FormName.sgdfy.value*1.0-FormName.ksdf.value*1.0+FormName.bk.value*1.0-FormName.sgdfk.value*1.0;
	}
	else{
		gdjskze=FormName.dejsje.value*1.0-FormName.sj.value*1.0-FormName.clf.value*1.0-FormName.zgclf.value*1.0-FormName.sgdfy.value*1.0-FormName.ksdf.value*1.0+FormName.bk.value*1.0-FormName.sgdfk.value*1.0-FormName.xbclk.value*1.0;
	}

	gdjskze=round(gdjskze,2);

	FormName.gdjskze.value=gdjskze;

	f_sqgz(FormName);

}

function f_sqgz(FormName)//����FormName:Form������
{
	//˰ǰ���� = ���ӽ�����ܶά�޽�-��ά�޷ѣ�������������ۿ�

	var sqgz=0;
	sqgz=FormName.gdjskze.value*1.0-FormName.wxj.value*1.0-FormName.kwxf.value*1.0-FormName.jkje.value*1.0-FormName.fakuan.value*1.0-FormName.kqtk.value*1.0;

	sqgz=round(sqgz,2);

	FormName.sqgz.value=sqgz;

}

function f_do(FormName)//����FormName:Form������
{
	f_jsk(FormName);

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
		alert("������[��������]��");
		FormName.zhzjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zhzjxje, "��������"))) {
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
	if(	javaTrim(FormName.khjskze)=="") {
		alert("������[�ͻ�������]��");
		FormName.khjskze.focus();
		return false;
	}
	if(!(isFloat(FormName.khjskze, "�ͻ�������"))) {
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

	if ("<%=jsfs%>"=="1")//1���������ѣ�2���������
	{
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
			alert("������[��������]��");
			FormName.glftd.focus();
			return false;
		}
		if(!(isFloat(FormName.glftd, "��������"))) {
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
	}
	

	if(	javaTrim(FormName.gckk)=="") {
		alert("������[���̿ۿ�]��");
		FormName.gckk.focus();
		return false;
	}
	if(!(isFloat(FormName.gckk, "���̿ۿ�"))) {
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

	if(!(isFloat(FormName.sjcb, "ʵ�ʳɱ�"))) {
		return false;
	}

	if(	javaTrim(FormName.gdjskze)=="") {
		alert("������[���ӽ�����ܶ�]��");
		FormName.gdjskze.focus();
		return false;
	}
	if(!(isFloat(FormName.gdjskze, "���ӽ�����ܶ�"))) {
		return false;
	}


	if(	javaTrim(FormName.clf)=="") {
		alert("������[�������Ϸ�]��");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "�������Ϸ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zgclf)=="") {
		alert("������[�Թ����Ϸ�]��");
		FormName.zgclf.focus();
		return false;
	}
	if(!(isFloat(FormName.zgclf, "�Թ����Ϸ�"))) {
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
	if(	javaTrim(FormName.ksdf)=="") {
		alert("������[��ˮ���]��");
		FormName.ksdf.focus();
		return false;
	}
	if(!(isFloat(FormName.ksdf, "��ˮ���"))) {
		return false;
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
	if(	javaTrim(FormName.kwxf)=="") {
		alert("������[��ά�޷�]��");
		FormName.kwxf.focus();
		return false;
	}
	if(!(isFloat(FormName.kwxf, "��ά�޷�"))) {
		return false;
	}

	if(	javaTrim(FormName.jkje)=="") {
		alert("������[�����]��");
		FormName.jkje.focus();
		return false;
	}
	if(!(isFloat(FormName.jkje, "�����"))) {
		return false;
	}
	if(	javaTrim(FormName.fakuan)=="") {
		alert("������[������]��");
		FormName.fakuan.focus();
		return false;
	}
	if(!(isFloat(FormName.fakuan, "������"))) {
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


	if(	javaTrim(FormName.sqgz)=="") {
		alert("������[˰ǰ����]��");
		FormName.sqgz.focus();
		return false;
	}
	if(!(isFloat(FormName.sqgz, "˰ǰ����"))) {
		return false;
	}


	if(	javaTrim(FormName.cwjsr)=="") {
		alert("������[���������]��");
		FormName.cwjsr.focus();
		return false;
	}
	if(	javaTrim(FormName.cwjssj)=="") {
		alert("������[�������ʱ��]��");
		FormName.cwjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cwjssj, "�������ʱ��"))) {
		return false;
	}

	FormName.action="SaveEditCwjsCw_gdjsjl.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>

