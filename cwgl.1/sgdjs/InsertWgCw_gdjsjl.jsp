<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String jsdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");
%>
<%
String khbh=request.getParameter("khbh");
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
String zjxwcbz=null;
double qye=0;
double wdzgce=0;
double hbssk=0;//������Ŀʵ�տ�

double zjxje=0;
double zhzjxje=0;
double sfke=0;
double zkl=0;
double hdzkl=0;
double zjxhdzk=0;
String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;
double zqwgzj=0;
double zhwgzj=0;
double htwgzj=0;//��ͬ�깤���
String fgsbh=null;
double glftd=0;
double fjje=0;
double gsfje=0;
String sffj=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;

double gckk=0;

String gdjsjlh=null;
String khlx=null;


double sjclf=0;//���Ϸ�
double tlk=0;
double bzclfbl =18;
double xbclk=0;
double ysf=0;
double psgjgff=0;
double wxjbfb=0;
double gcjxkk=0;
double sj=0;
double kqtk=0;
double jkje=0;
double gczxjl=0;
double ycfbk=0;

double glf=0;
double gdjskze=0;//Ӧ������
double wxj=0;//���ʱ���
double lbcb=0;//����ɱ�

try {
	conn=cf.getConnection();

	ls_sql="select bzclfbl,lbcb";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bzclfbl=rs.getDouble("bzclfbl");
		lbcb=rs.getDouble("lbcb");
	}
	rs.close();
	ps.close();

	ls_sql="select glftd,fgsbh,cxhdbm,cxhdbmxq,cxhdbmzh,zkl,zjxwcbz,zjxje,zhzjxje,sfke,khxm,fwdz,lxfs,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,jzbz,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq,fjje,gsfje,sffj";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		glftd=rs.getDouble("glftd");
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		zkl=rs.getDouble("zkl");
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");
		sfke=rs.getDouble("sfke");
		qye=rs.getDouble("qye");
		wdzgce=rs.getDouble("wdzgce");
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		sffj=cf.fillNull(rs.getString("sffj"));

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


	zqwgzj=cf.doubleTrim(wdzgce+zjxje);


	if (zjxwcbz.equals("1"))
	{
//		out.println("����������δ��ɣ����ܽ���");
//		return;
	}

	if (jzbz.equals(""))
	{
		jzbz="1";
	}

	if (cxhdbm.equals("")||cxhdbm.equals("�޻"))
	{
		khlx="1";		
		if(sffj.equals("Y"))
		{
		zhwgzj=cf.doubleTrim(qye+zhzjxje-gsfje);
		}
		else
		{
		zhwgzj=cf.doubleTrim(qye+zhzjxje);
		}
	}
	else{//����μӻ��ȡ:��ۿ�
		khlx="2";

		double yjxs1=10;
		if (!cxhdbm.equals(""))
		{
			ls_sql="select yjxs";
			ls_sql+=" from  jc_cxhdyjxs";
			ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+fgsbh+"' and yjxsbm='11'";//11��ʩ���ӻ�ۿ�
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				yjxs1=rs.getDouble("yjxs");
			}
			else{
				rs.close();
				ps.close();
//				out.println("���󣡲μӴ���������ڣ�"+cxhdbm);
//				return;
			}
			rs.close();
			ps.close();
		}

		if (yjxs1<=0 || yjxs1>10)
		{
//			out.println("���󣡴�����ɱ���������ȷ��"+yjxs1);
//			return;
		}

		double yjxs2=10;
		if (!cxhdbmxq.equals(""))
		{
			ls_sql="select yjxs";
			ls_sql+=" from  jc_cxhdyjxs";
			ls_sql+=" where cxhdmc='"+cxhdbmxq+"' and fgsbh='"+fgsbh+"' and yjxsbm='11'";//11��ʩ���ӻ�ۿ�
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				yjxs2=rs.getDouble("yjxs");
			}
			else{
				rs.close();
				ps.close();
				out.println("���󣡲μӴ���������ڣ�"+cxhdbmxq);
				return;
			}
			rs.close();
			ps.close();
		}

		if (yjxs2<=0 || yjxs2>10)
		{
			out.println("���󣡴�����ɱ���������ȷ��"+yjxs2);
			return;
		}

		double yjxs3=10;
		if (!cxhdbmzh.equals(""))
		{
			ls_sql="select yjxs";
			ls_sql+=" from  jc_cxhdyjxs";
			ls_sql+=" where cxhdmc='"+cxhdbmzh+"' and fgsbh='"+fgsbh+"' and yjxsbm='11'";//11��ʩ���ӻ�ۿ�
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				yjxs3=rs.getDouble("yjxs");
			}
			else{
				rs.close();
				ps.close();
				out.println("���󣡲μӴ���������ڣ�"+cxhdbmzh);
				return;
			}
			rs.close();
			ps.close();
		}

		if (yjxs3<=0 || yjxs3>10)
		{
			out.println("���󣡴�����ɱ���������ȷ��"+yjxs3);
			return;
		}

		hdzkl=10-(10-yjxs1)-(10-yjxs2)-(10-yjxs3);

		zhwgzj=cf.doubleTrim((qye+zjxje)*hdzkl/10);
	}
	htwgzj=cf.doubleTrim(qye+zhzjxje);
	
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

	xbclk=cf.doubleTrim(htwgzj*bzclfbl/100.0-sjclf);//���Ͽۿ���Ϸѽ���18%ʱ�Ĳ�����Ϊ���Ͽۿ�
	if (xbclk<0)
	{
		xbclk=0;
	}

	//���͹��߹�����,��ȡ���ֹ�˾���ϵ��ۣ�
	ls_sql="select sum(cl_ckmx.cksl*cl_ckmx.fgsdj)";
	ls_sql+=" from  cl_ckd,cl_ckmx";
	ls_sql+=" where cl_ckd.ckph=cl_ckmx.ckph and cl_ckd.khbh='"+khbh+"'";
	ls_sql+=" and cl_ckmx.cldlmc='����'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		psgjgff=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//�����
	ls_sql="select sum(cl_ckd.yf)";
	ls_sql+=" from  cl_ckd";
	ls_sql+=" where cl_ckd.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//���ʱ���ٷֱ�
	double mqzbj=0;
	ls_sql="select zbj";
	ls_sql+=" from  sq_sgd";
	ls_sql+=" where  sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mqzbj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select bfb";
	ls_sql+=" from  cw_kzbjbl";
	ls_sql+=" where  fgsbh='"+fgsbh+"' and qd<="+mqzbj+" and "+mqzbj+"<zd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wxjbfb=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	ls_sql="select bfb";
	ls_sql+=" from  cw_jxkkbl";
	ls_sql+=" where  fgsbh='"+fgsbh+"' and qd<="+mqzbj+" and "+mqzbj+"<zd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wxjbfb=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	
	//���̼���ۿ�
	double jxbfb=0;//���̼���
	double jxkkbl=0;//���̼���ۿ����
	//���������
	double zxbfb=0;//��������ٷֱ�
	double zxjlbl=0;//�������������

	if (zhzjxje>=0)//�����
	{
		zxbfb=zhzjxje*100.0/qye;

		ls_sql="select bfb";
		ls_sql+=" from  cw_zxjlbl";
		ls_sql+=" where  fgsbh='"+fgsbh+"' and qd<="+zxbfb+" and "+zxbfb+"<zd";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zxjlbl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		gczxjl=cf.doubleTrim(zhwgzj*zxjlbl/100.0);
	}
	else{//����ۿ�
		jxbfb=-1*zhzjxje*100.0/qye;

		ls_sql="select bfb";
		ls_sql+=" from  cw_jxkkbl";
		ls_sql+=" where  fgsbh='"+fgsbh+"' and qd<="+jxbfb+" and "+jxbfb+"<zd";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jxkkbl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		gcjxkk=cf.doubleTrim(htwgzj*jxkkbl/100.0);
	}
	

	//���칤��ʩ��һ���ա�����˰���������Ƿ��ã��깤��۵�1.85%
	sj=cf.doubleTrim(htwgzj*0.0185);

	//�����ۿ�
	ls_sql="select sum(kkje)";
	ls_sql+=" from  cw_kqtkjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kqtk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//ǰ���Ѳ�����
	ls_sql="select sum(jkje)";
	ls_sql+=" from  cw_gdjkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and jklx in('3','4')";//0��δ���㣻1���ѽ���
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jkje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//Զ�̷Ѳ���
	ls_sql="select sum(fkje)";
	ls_sql+=" from cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='71' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ycfbk=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	ycfbk=ycfbk*0.5;
	
	
	
	glf=htwgzj*glftd/100;//�����깤��ۡ������ѱ���
	glf=cf.doubleTrim(glf);
	gdjskze=zhwgzj*(100-glftd)/100;
	gdjskze=cf.doubleTrim(gdjskze);
	

	wxj=htwgzj/100.0*wxjbfb;
	wxj=cf.doubleTrim(wxj);

/************************************************************************/

	//��ȡ��¼��
	ls_sql="select NVL(max(substr(gdjsjlh,8,2)),0)";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	gdjsjlh=khbh+cf.addZero(count+1,2);
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
      <div align="center">ʩ�����깤���㣨�����¼�ţ�<%=gdjsjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">
<form method="post" action="" name="insertform" target="_blank" onClick="f_jsglf(insertform)">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">�ͻ����</td>
              <td width="32%"><%=khbh%></td>
              <td align="right" width="18%">��ͬ��</td>
              <td width="32%"><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="32%"><%=khxm%>��<%=lxfs%>�� </td>
              <td width="18%"> 
                <div align="right">�ʼ�����</div>
              </td>
              <td width="32%"><%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">���ݵ�ַ</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="18%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="32%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">ǩԼ����</td>
              <td width="32%"><%=qyrq%></td>
              <td align="right" width="18%">ʵ���������</td>
              <td width="32%"><%=sjwjrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">��ͬ��������</td>
              <td width="32%"><%=kgrq%></td>
              <td align="right" width="18%">��ͬ��������</td>
              <td width="32%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">ʵ�ʿ�������</td>
              <td width="32%"><%=sjkgrq%></td>
              <td align="right" width="18%">ʵ�ʿ�������</td>
              <td width="32%"><%=sjjgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td height="28" colspan="4" align="center"><b><font color="#000099">��������</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#0000FF">�μӹ�˾�����</font></td>
              <td colspan="3"> 
                <input type="text" name="cxhdbm" value="<%=cxhdbm%>" size="73" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#0000FF">�μ�С�������</font></td>
              <td colspan="3"> 
                <input type="text" name="cxhdbmxq" value="<%=cxhdbmxq%>" size="73" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#0000FF">�μ�չ������</font></td>
              <td colspan="3"> 
                <input type="text" name="cxhdbmzh" value="<%=cxhdbmzh%>" size="73" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#0000FF">ʩ����</font></td>
              <td width="32%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%> 
                </select>
              </td>
              <td align="right" width="18%"><font color="#0000FF">�ͻ�����</font></td>
              <td width="32%"> 
                <select name="khlx" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectToken(out,"1+�Ǽӻ�ͻ�&2+�μӻ�ͻ�",khlx,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#0000FF">�ۿ���</font></td>
              <td width="32%"> 
                <input type="text" name="zkl" value="<%=zkl%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="18%">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#0000FF">����ԭ����</font></td>
              <td width="32%"> 
                <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="18%"><font color="#0000FF">����ǩԼ��</font></td>
              <td width="32%"> 
                <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#0000FF">�г���ȯ�ܶ�</font></td>
              <td width="32%"> 
                <input name="fjje" type="text" id="fjje" value="<%=fjje%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="18%"><font color="#0000FF">��˾�е���</font></td>
              <td width="32%"> 
                <input name="gsfje" type="text" id="gsfje" value="<%=gsfje%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#0000FF">��ǰ��������</font></td>
              <td width="32%"> 
                <input type="text" name="zjxje" value="<%=zjxje%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="18%"><font color="#0000FF">�ۺ���������</font></td>
              <td width="32%"> 
                <input type="text" name="zhzjxje" value="<%=zhzjxje%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#0000FF">��ǰ�깤���</font></td>
              <td width="32%"> 
                <input type="text" name="zqwgzj" value="<%=zqwgzj%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="18%"><font color="#0000FF">�����깤���</font></td>
              <td width="32%"> 
                <input type="text" name="zhwgzj" value="<%=zhwgzj%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#0000FF">��װʵ�տ��ܶ�</font></td>
              <td width="32%"> 
                <input type="text" name="khsskze" value="<%=sfke%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="18%"><font color="#0000FF">��ͬ�깤���</font></td>
              <td width="32%"> 
                <input type="text" name="htwgzj" value="<%=htwgzj%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#0000FF">�����ѱ���</font></td>
              <td width="32%"> 
                <input type="text" name="glftd" value="<%=glftd%>" size="10" maxlength="17" onChange="f_jsglf(insertform)" readonly>
                % </td>
              <td align="right" width="18%"><font color="#0000FF">������</font></td>
              <td width="32%"> 
                <input type="text" name="glf" value="<%=glf%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#0000FF">Ӧ������</font></td>
              <td colspan="3"> 
                <input type="text" name="gdjskze" value="<%=gdjskze%>" size="20" maxlength="17" readonly>
                &nbsp;&nbsp;<b>Ӧ�����ѣ������깤��ۡ���1-�����ѱ�����</b> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" height="30" align="center"><b><font color="#000099">���ۿ���Ŀ</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��׼���Ϸѱ���</td>
              <td width="32%"> 
                <input type="text" name="bzclfbl" value="<%=bzclfbl%>" size="10" maxlength="17" onChange="f_clfbl(insertform)">
                % </td>
              <td width="18%" align="right"><font color="#0000FF">���Ϸ�</font></td>
              <td width="32%"> 
                <input type="text" name="clf" value="<%=sjclf%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000FF">���Ͽۿ�</font></td>
              <td colspan="3"><b> 
                <input type="text" name="xbclk" value="<%=xbclk%>" size="20" maxlength="17" readonly>
                ���Ͽۿ���Ϸѽ���18%ʱ�Ĳ�����Ϊ���Ͽۿ�</b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000FF">���͹��߹�����</font></td>
              <td width="32%"> 
                <input type="text" name="psgjgff" value="<%=psgjgff%>" size="20" maxlength="17" readonly>
              </td>
              <td width="18%" align="right"><font color="#0000FF">�����</font></td>
              <td width="32%"> 
                <input type="text" name="ysf" value="<%=ysf%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000FF">���ʱ���ٷֱ�</font></td>
              <td width="32%"> 
                <input type="text" name="wxjbfb" value="<%=wxjbfb%>" size="10" maxlength="17" readonly>
                % </td>
              <td width="18%" align="right"><font color="#0000FF">���ʱ���</font></td>
              <td width="32%"> 
                <input type="text" name="wxj" value="<%=wxj%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000FF">���̼���ۿ�</font></td>
              <td width="32%"> 
                <input type="text" name="gcjxkk" value="<%=gcjxkk%>" size="20" maxlength="17" readonly>
              </td>
              <td width="18%" align="right"><font color="#0000FF">����˰������</font></td>
              <td width="32%"> 
                <input type="text" name="sj" value="<%=sj%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">����ɱ�</td>
              <td width="32%"> 
                <input name="lbcb" type="text" onChange="f_jsglf(insertform)" value="<%=lbcb%>" size="20" maxlength="17">
              </td>
              <td width="18%" align="right"><font color="#0000FF">�����ۿ�</font></td>
              <td width="32%"> 
                <input type="text" name="kqtk" value="<%=kqtk%>" size="20" maxlength="17" readonly>
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
                <input type="text" name="sqgz" value="" size="20" maxlength="17" readonly>
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
              <td align="right" width="18%"><font color="#0000FF">��������</font></td>
              <td width="32%"> 
                <select name="jslx" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value="1">�깤����</option>
                </select>
              </td>
              <td align="right" width="18%"><font color="#0000FF">���㵥λ</font></td>
              <td width="32%"> 
                <select name="jsdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jsdw+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000FF">������</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="jsr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000FF">����ʱ��</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="jssj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <p> 
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset"  value="����" name="reset">
                  <input type="button" name="kk" onClick="window.open('/cwgl/kqtk/Cw_kqtkjlCxList.jsp?fgs=<%=fgsbh%>&khbh=<%=khbh%>')" value="�����ۿ���ϸ">
                  <input type="button" name="bk" onClick="window.open('/cwgl/sgdjk/Cw_gdjkjlCxList.jsp?cw_gdjkjl_khbh=<%=khbh%>&fgs=<%=fgsbh%>&scbz=N')" value="ǰ�ڲ����¼">
                  <input type="button" name="ck" onClick="window.open('/fcgl/cl_ckd/Cl_ckdCxList.jsp?khbh=<%=khbh%>&fgs=<%=fgsbh%>&myxssl=30')" value="���ϳ�����ϸ" >
                  <input type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="�ͻ��տ���Ϣ">
                  <input type="button" onClick="window.open('/cwgl/sgdjs/DyWgDzd.jsp?khbh=<%=khbh%>')" value="�깤���˵�" >
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
	bzclf=<%=htwgzj%>*FormName.bzclfbl.value/100;
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
	f_clfbl(FormName);

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
		alert("������[�����깤���]��");
		FormName.zhwgzj.focus();
		return false;
	}
	if(!(isFloat(FormName.zhwgzj, "�����깤���"))) {
		return false;
	}
	if(	javaTrim(FormName.htwgzj)=="") {
		alert("������[��ͬ�깤���]��");
		FormName.htwgzj.focus();
		return false;
	}
	if(!(isFloat(FormName.htwgzj, "��ͬ�깤���"))) {
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
		alert("������[�����ѱ���]��");
		FormName.glftd.focus();
		return false;
	}
	if(!(isFloat(FormName.glftd, "�����ѱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.glf)=="") {
		alert("������[������]��");
		FormName.glf.focus();
		return false;
	}
	if(!(isFloat(FormName.glf, "������"))) {
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
	glf=<%=htwgzj%>*FormName.glftd.value/100;//�ۺ��깤��ۡ������ѱ���
	glf=round(glf,2);
	FormName.glf.value=glf;
	
	var glftd=0;
	glftd=FormName.glftd.value;

	var gdjskze=0;//Ӧ������
	gdjskze=<%=zhwgzj%>*(100-glftd)/100;//�ۺ��깤��ۡ������ѱ���
	gdjskze=round(gdjskze,2);
	FormName.gdjskze.value=gdjskze;

	var wxj=0;//���ʱ���=Ӧ������*���ʱ���ٷֱ�
	wxj=FormName.htwgzj.value/100.0*FormName.wxjbfb.value;
	wxj=round(wxj,2);
	FormName.wxj.value=wxj;



	//���ۿ���Ŀ
	if(	javaTrim(FormName.bzclfbl)=="") {
		alert("������[��׼���Ϸѱ���]��");
		FormName.bzclfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bzclfbl, "��׼���Ϸѱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.clf)=="") {
		alert("������[���Ϸ�]��");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "���Ϸ�"))) {
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
	f_clfbl(FormName);
	
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
	if(	javaTrim(FormName.htwgzj)=="") {
		alert("������[��ͬ�깤���]��");
		FormName.htwgzj.focus();
		return false;
	}
	if(!(isFloat(FormName.htwgzj, "��ͬ�깤���"))) {
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
		alert("������[�����ѱ���]��");
		FormName.glftd.focus();
		return false;
	}
	if(!(isFloat(FormName.glftd, "�����ѱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.glf)=="") {
		alert("������[������]��");
		FormName.glf.focus();
		return false;
	}
	if(!(isFloat(FormName.glf, "������"))) {
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
	if(	javaTrim(FormName.bzclfbl)=="") {
		alert("������[��׼���Ϸѱ���]��");
		FormName.bzclfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bzclfbl, "��׼���Ϸѱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.clf)=="") {
		alert("������[���Ϸ�]��");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "���Ϸ�"))) {
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
	if(	javaTrim(FormName.jsdw)=="") {
		alert("��ѡ��[���㵥λ]��");
		FormName.jsdw.focus();
		return false;
	}


	FormName.action="SaveInsertWgCw_gdjsjl.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>