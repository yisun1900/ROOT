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
double glf=0;
double ksdf=0;

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

double zjxje=0;
double sfke=0;
double zkl=0;
double bk=0;

double hbssk=0;//������Ŀʵ�տ�
double wxj=0;//ά�޽�
double wxjbfb=0;//ά�޽�

String sjsfy=null;
String sgdfy=null;
String zjfy=null;
String gsfy=null;
String qtfy=null;
String gckk=null;

String spr=null;
String spsj=null;
String spjl=null;
String spyj=null;

double jkje=0;
double fakuan=0;
double kwxf=0;
double sj=0;
double clf=0;//�������Ϸ�
double zgclf=0;//�Թ����Ϸ�
double kqtk=0;//��������
double dejsje=0;

String gdjsjlh=cf.GB2Uni(request.getParameter("gdjsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dejsje,wxjbfb,wxj,spr,spsj,spjl,spyj,khbh,khjskze,khsskze,sjcb,tdjs,glftd,ksdf,bk,bz,tdjsje,gckk,sjsfy,sgdfy,zjfy,gsfy,qtfy ";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where  (gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dejsje=rs.getDouble("dejsje");
		wxjbfb=rs.getDouble("wxjbfb");
		wxj=rs.getDouble("wxj");
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
		sgdfy=cf.fillNull(rs.getString("sgdfy"));
		zjfy=cf.fillNull(rs.getString("zjfy"));
		gsfy=cf.fillNull(rs.getString("gsfy"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		gckk=cf.fillNull(rs.getString("gckk"));
	}
	rs.close();
	ps.close();

	
	ls_sql="select zkl,zjxje,sfke,khxm,fwdz,lxfs,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,jzbz,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
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

	sj=((int)(sfke*0.0321*100+0.5))/100.0;

	if (jzbz.equals("1"))
	{
		glf=(tdjsje-sj)*glftd/100;//��װ����ѣ�����������˰�𣩡���������
	}
	else{
		glf=tdjsje*glftd/100;//��װ����ѣ�����������������
	}

	glf=cf.doubleTrim(glf);

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


	ls_sql="select sum(jkje)";
	ls_sql+=" from  cw_gdjkjl";
	ls_sql+=" where khbh='"+khbh+"' and gdjsjd='0' and jklx in('1','9')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jkje=rs.getDouble(1);//�����
	}
	rs.close();
	ps.close();

	ls_sql="select sum(jkje)";
	ls_sql+=" from  cw_gdjkjl";
	ls_sql+=" where khbh='"+khbh+"' and gdjsjd='0' and jklx in('2')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zgclf=rs.getDouble(1);//�Թ����Ϸ�
	}
	rs.close();
	ps.close();

	ls_sql="select sum(kkje)";
	ls_sql+=" from  cw_kqtkjl";
	ls_sql+=" where sgd='"+sgd+"' and jsbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kqtk=rs.getDouble(1);//��������
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkze)";
	ls_sql+=" from  kp_xjgdjl,crm_khxx";
	ls_sql+=" where kp_xjgdjl.khbh=crm_khxx.khbh and crm_khxx.sgd='"+sgd+"' and kp_xjgdjl.jsbz='N' and kp_xjgdjl.cfspbz='3' ";//2��δ������3������ͨ����4������δͨ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fakuan=rs.getDouble(1);//������
	}
	rs.close();
	ps.close();

	ls_sql="select sum(zrfcdfy)";
	ls_sql+=" from  crm_wxfmx";
	ls_sql+=" where crm_wxfmx.jsbz='N' and sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kwxf=rs.getDouble(1);//��ά�޷�
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
              <td align="right" width="19%">�ͻ����</td>
              <td width="31%"><%=khbh%></td>
              <td align="right" width="18%">��ͬ��</td>
              <td width="32%"><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="31%"><%=khxm%> </td>
              <td width="18%"> 
                <div align="right">�ʼ�����</div>
              </td>
              <td width="32%"><%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">���ݵ�ַ</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="18%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="32%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">ǩԼ����</td>
              <td width="31%"><%=qyrq%></td>
              <td align="right" width="18%">ʵ���������</td>
              <td width="32%"><%=sjwjrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">��ͬ��������</td>
              <td width="31%"><%=kgrq%></td>
              <td align="right" width="18%">��ͬ��������</td>
              <td width="32%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">ʵ�ʿ�������</td>
              <td width="31%"><%=sjkgrq%></td>
              <td align="right" width="18%">ʵ�ʿ�������</td>
              <td width="32%"><%=sjjgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000FF">ʩ����</font></td>
              <td width="31%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%> 
                </select>
              </td>
              <td align="right" width="18%"><font color="#0000FF">��װ��־</font></td>
              <td width="32%"> 
                <select name="jzbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectToken(out,"1+��װ&2+��װ",jzbz,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000FF">��װǩԼ��</font></td>
              <td width="31%"> 
                <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="18%"><font color="#0000FF">δ���۹��̶�</font></td>
              <td width="32%"> 
                <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000FF">��������</font></td>
              <td width="31%"> 
                <input type="text" name="zjxje" value="<%=zjxje%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="18%"><font color="#0000FF">����ʵ�տ��ܶ�</font></td>
              <td width="32%"> 
                <input type="text" name="khsskze" value="<%=sfke%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000FF"></font></td>
              <td width="31%"> 
              </td>
              <td align="right" width="18%"><font color="#0000FF">������Ŀʵ�տ�</font></td>
              <td width="32%"> 
                <input type="text" name="hbssk" value="<%=hbssk%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000FF">�ۿ���</font></td>
              <td width="31%"> 
                <input type="text" name="zkl" value="<%=zkl%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="18%">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td height="27" colspan="4" align="center" bgcolor="#FFFFCC">������Ϣ</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000FF">�ͻ�������</font></td>
              <td width="31%"> 
                <input type="text" name="khjskze" value="<%=khjskze%>" size="20" maxlength="17" onChange="f_jsglf(editform)" readonly>
              </td>
              <td align="right" width="18%"><font color="#0000FF">ʵ�ʳɱ�</font></td>
              <td width="32%"> 
                <input type="text" name="sjcb" size="20" maxlength="17"  value="<%=sjcb%>" onChange="f_jsglf(editform)" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#0000FF">������</font></div>
              </td>
              <td width="31%"> 
                <select name="tdjs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f_jsglf(editform)">
                  <%
	cf.selectToken(out,"1+�ͻ�������&2+ʵ�տ�&3+ǩԼ��&4+ʵ�ʳɱ�&9+����",tdjs,false);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000FF">���������</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="tdjsje" size="20" maxlength="17"  value="<%=tdjsje%>" onChange="f_jsk(insertform)" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#0000FF">���ʦ�е�����</font></div>
              </td>
              <td width="31%"> 
                <input type="text" name="sjsfy" size="20" maxlength="17"  value="<%=sjsfy%>" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000FF">ʩ���ӳе�����</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="sgdfy" size="20" maxlength="17"  value="<%=sgdfy%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#0000FF">�ʼ�е�����</font></div>
              </td>
              <td width="31%"> 
                <input type="text" name="zjfy" size="20" maxlength="17"  value="<%=zjfy%>" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000FF">��˾�е�����</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="gsfy" size="20" maxlength="17"  value="<%=gsfy%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#0000FF">�������е�����</font></div>
              </td>
              <td width="31%"> 
                <input type="text" name="qtfy" size="20" maxlength="17"  value="<%=qtfy%>" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000FF">���̿ۿ�</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="gckk" value="<%=gckk%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF" width="19%"><font color="#0000FF">��ע</font></td>
              <td colspan="3" bgcolor="#E8E8FF"><%=bz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC" width="19%"><font color="#0000FF">��������</font></td>
              <td bgcolor="#FFFFCC" width="31%"> 
                <input type="text" name="glftd" size="10" maxlength="17"  value="<%=glftd%>" onChange="f_jsk(insertform)" readonly>
                % </td>
              <td align="right" bgcolor="#FFFFCC" width="18%"><font color="#0000FF">�����</font></td>
              <td bgcolor="#FFFFCC" width="32%"> 
                <input type="text" name="glf" size="20" maxlength="17"  value="<%=glf%>" onChange="f_jsk(insertform)" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC" width="19%"><font color="#0000FF">ά�޽�ٷֱ�</font></td>
              <td bgcolor="#FFFFCC" width="31%"> 
                <input name="wxjbfb" type="text" onChange="f_wxj(editform)"  value="<%=wxjbfb%>" size="10" maxlength="17" readonly>
                % </td>
              <td align="right" bgcolor="#FFFFCC" width="18%"><font color="#0000FF">ά�޽�</font></td>
              <td bgcolor="#FFFFCC" width="32%"> 
                <input type="text" name="wxj" size="20" maxlength="17"  value="<%=wxj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC" width="19%"><font color="#0000FF">��������</font></td>
              <td bgcolor="#FFFFCC" width="31%"> <%
	cf.radioToken(out, "spjl","3+ͬ��&4+��ͬ��",spjl,true);
%> </td>
              <td bgcolor="#FFFFCC" width="18%" align="right"><font color="#0000FF">����</font></td>
              <td bgcolor="#FFFFCC" width="32%"> 
                <input type="text" name="bk" size="20" maxlength="17"  value="<%=bk%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td bgcolor="#FFFFCC" width="19%"> 
                <div align="right"><font color="#0000FF">������</font></div>
              </td>
              <td bgcolor="#FFFFCC" width="31%"> <%=spr%> </td>
              <td bgcolor="#FFFFCC" width="18%"> 
                <div align="right"><font color="#0000FF">����ʱ��</font></div>
              </td>
              <td bgcolor="#FFFFCC" width="32%"> <%=spsj%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC" width="19%"><font color="#0000FF">�������</font></td>
              <td colspan="3" bgcolor="#FFFFCC"> <%=spyj%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" width="19%"><font color="#0000FF">���������</font></td>
              <td width="31%">
                <input type="text" name="dejsje" value="<%=dejsje%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="18%">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000FF">��ά�޷�</font></td>
              <td width="31%"> 
                <input type="text" name="kwxf" value="<%=kwxf%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="18%">˰��</td>
              <td width="32%"> 
                <input type="text" name="sj" value="<%=sj%>" size="20" maxlength="17" onChange="f_jsk(insertform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">�������Ϸ�</td>
              <td width="31%"> 
                <input type="text" name="clf" value="<%=clf%>" size="20" maxlength="9" >
              </td>
              <td align="right" width="18%">�Թ����Ϸ�</td>
              <td width="32%"> 
                <input name="zgclf" type="text" id="zgclf" value="<%=zgclf%>" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000FF">�����</font></td>
              <td width="31%"> 
                <input type="text" name="jkje" value="<%=jkje%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="18%">������</td>
              <td width="32%"> 
                <input type="text" name="fakuan" value="<%=fakuan%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"> ��������</td>
              <td width="31%"> 
                <input type="text" name="kqtk" value="<%=kqtk%>" size="20" maxlength="17" >
              </td>
              <td align="right" width="18%">��ˮ���</td>
              <td width="32%"> 
                <input name="ksdf" type="text" id="ksdf" value="0" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#0000FF">���������</font></div>
              </td>
              <td width="31%"> 
                <input type="text" name="cwjsr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000FF">�������ʱ��</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="cwjssj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�������˵��</td>
              <td colspan="3"> 
                <textarea name="cwjssm" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <p> 
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="button" value="�鿴������Ϣ" onClick="f_ck(insertform)" name="ck" disabled>
                  <input type="reset"  value="����" name="reset">
                  <input name="button2" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="�ͻ��տ���Ϣ">
                  <input type="hidden" name="khbh" value="<%=khbh%>" >
                  <input type="hidden" name="gdjsjlh" value="<%=gdjsjlh%>" >
                </p>
                <p>
                  <input name="button4" type="button" onClick="window.open('dejs.jsp?khbh=<%=khbh%>&gdjsjlh=<%=gdjsjlh%>')" value="�������">
                  <input type="button" onClick="window.open('/cwgl/sgdjs/JkjlList.jsp?khbh=<%=khbh%>')" value="����¼">
                  <input type="button" onClick="window.open('/cwgl/sgdjs/WjsWxjlList.jsp?sgd=<%=sgd%>')" value="δ����ά�޼�¼">
                  <input type="button" onClick="window.open('/cwgl/sgdjs/WjsFkjlList.jsp?sgd=<%=sgd%>')" value="δ���㷣���¼">
                  <input type="button" onClick="window.open('/cwgl/sgdjs/WjsKqtkList.jsp?sgd=<%=sgd%>')" value="δ�����������">
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
		FormName.glf.value=round((FormName.tdjsje.value*1.0-FormName.sj.value*1.0)*FormName.glftd.value/100.0,2);
		<%
	}
	else{
		%>
		//��װ����ѣ�����������������
		FormName.glf.value=round((FormName.tdjsje.value*1.0)*FormName.glftd.value/100.0,2);
		<%
	}
	%>
}

function f_do(FormName)//����FormName:Form������
{
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
		alert("������[δ���۹��̶�]��");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "δ���۹��̶�"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxje)=="") {
		alert("������[��������]��");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "��������"))) {
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

	if(!(isFloat(FormName.sjcb, "ʵ�ʳɱ�"))) {
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
	if(	javaTrim(FormName.kwxf)=="") {
		alert("������[��ά�޷�]��");
		FormName.kwxf.focus();
		return false;
	}
	if(!(isFloat(FormName.kwxf, "��ά�޷�"))) {
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
	if(	javaTrim(FormName.ksdf)=="") {
		alert("������[��ˮ���]��");
		FormName.ksdf.focus();
		return false;
	}
	if(!(isFloat(FormName.ksdf, "��ˮ���"))) {
		return false;
	}
	if(	javaTrim(FormName.kqtk)=="") {
		alert("������[��������]��");
		FormName.kqtk.focus();
		return false;
	}
	if(!(isFloat(FormName.kqtk, "��������"))) {
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

/*
	if(	javaTrim(FormName.gdjskze)=="") {
		alert("������[���ӽ�����ܶ�]��");
		FormName.gdjskze.focus();
		return false;
	}
	if(!(isFloat(FormName.gdjskze, "���ӽ�����ܶ�"))) {
		return false;
	}
*/

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

	FormName.action="SaveCwjsCw_gdjsjl.jsp";
	FormName.submit();
	FormName.ck.disabled=false;
	return true;
}


//-->
</SCRIPT>
