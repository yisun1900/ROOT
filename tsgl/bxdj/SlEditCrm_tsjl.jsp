<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zdyhbz=(String)session.getAttribute("zdyhbz");
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String email=null;

String dwbh=null;
String dwmc=null;
String zjxm=null;
String sgd=null;
String sgdmc=null;
String sjs=null;
String hth=null;
String sgbz=null;
String sjkgrq=null;
String sjjgrq=null;
String ssfgs=null;

String kbxbz=null;
String bxkssj=null;
String bxjzsj=null;
String bybxsm=null;
int syts=0;

String djbh=null;
String hfdjbz=null;
String djyy=null;
String djsj=null;
String djr=null;
String jhjdsj=null;


String slfsbm=null;
String sfxhf=null;
String hfsj=null;
String tsbxsj=null;
String slr=null;
String slsj=null;
String lrr=null;
String lrsj=null;
String clzt=null;
String yzcdbm=null;
String bz=null;
String yqjjsj=null;
String slbm=null;
String tsnr=null;
String wxsgd=null;
String zrbmclzt=null;

String tsyybm=null;
String tslxbm="";
String tsxlbm=null;
String tsbm="";

String jcppbz="Y";
String tsppstr="";

String rglrbz="";//�˹�¼���־
String rglrtspp="";
String xllbStyle="";
String rglrStyle="";

int dzyy=0;//����ԭ��
String txxx="";
String ygbh=null;
String sfxnbgz=null;
String nbgzsj=null;

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select sfxnbgz,nbgzsj,tsbxsj,lrr,lrsj,zrbmclzt,slsj,tsnr,slbm,crm_tsjl.bz,yzcdbm,slfsbm,khbh,crm_tsjl.sfxhf,crm_tsjl.hfsj,slr,clzt,crm_tsjl.yqjjsj,crm_tsjl.wxsgd";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where crm_tsjl.tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfxnbgz=cf.fillNull(rs.getString("sfxnbgz"));
		nbgzsj=cf.fillNull(rs.getDate("nbgzsj"));
		tsbxsj=cf.fillNull(rs.getDate("tsbxsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		zrbmclzt=cf.fillNull(rs.getString("zrbmclzt"));
		slsj=cf.fillNull(rs.getDate("slsj"));
		tsnr=cf.fillNull(rs.getString("tsnr"));
		slbm=cf.fillNull(rs.getString("slbm"));
		bz=cf.fillNull(rs.getString("bz"));
		yzcdbm=cf.fillNull(rs.getString("yzcdbm"));
		slfsbm=cf.fillNull(rs.getString("slfsbm"));
		khbh=cf.fillNull(rs.getString("khbh"));

		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		slr=cf.fillNull(rs.getString("slr"));
		clzt=cf.fillNull(rs.getString("clzt"));
		yqjjsj=cf.fillNull(rs.getDate("yqjjsj"));

		wxsgd=cf.fillNull(rs.getString("wxsgd"));
	}
	rs.close();
	ps.close();



	ls_sql="select count(*)";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dzyy=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (dzyy>0)
	{
		txxx="<BR><font color=\"#FF0000\">��ע�⣺["+lrr+"]¼���˶���ԭ��������ť���鿴����ԭ�򡻣�ȷ���Ƿ���ȷ��</font>";
	}

	ls_sql="select khbh,khxm,fwdz,lxfs,qtdh,crm_khxx.email,crm_khxx.dwbh,dwmc,sjs,crm_khxx.sgd,sgdmc,zjxm,hth,sjkgrq,sjjgrq,djbh,hfdjbz,djyy,djsj,djr,jhjdsj,sgbz,fgsbh,kbxbz,bxkssj,bxjzsj,bybxsm,bxjzsj-SYSDATE syts";
	ls_sql+=" from  crm_khxx,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));

		djbh=cf.fillNull(rs.getString("djbh"));
		hfdjbz=cf.fillNull(rs.getString("hfdjbz"));
		djyy=cf.fillNull(rs.getString("djyy"));
		djsj=cf.fillNull(rs.getDate("djsj"));
		djr=cf.fillNull(rs.getString("djr"));
		jhjdsj=cf.fillNull(rs.getDate("jhjdsj"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));

		kbxbz=cf.fillNull(rs.getString("kbxbz"));
		bxkssj=cf.fillNull(rs.getDate("bxkssj"));
		bxjzsj=cf.fillNull(rs.getDate("bxjzsj"));
		bybxsm=cf.fillNull(rs.getString("bybxsm"));
		syts=rs.getInt("syts");
	}
	rs.close();
	ps.close();

	ls_sql="select tsyybm,tslxbm,tsxlbm,dwbh,ygbh";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tsyybm=cf.fillNull(rs.getString("tsyybm"));
		tslxbm=cf.fillNull(rs.getString("tslxbm"));
		tsxlbm=cf.fillNull(rs.getString("tsxlbm"));
		tsbm=cf.fillNull(rs.getString("dwbh"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
	}
	rs.close();
	ps.close();

	//�����˹�¼���־������������������������������ʼ
	int sl=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"' and rglrbz='2' ";//1��ϵͳȡ��2���˹�¼��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (sl>0)
	{
		ls_sql="select tspp";
		ls_sql+=" from  crm_tsbm";
		ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"' and rglrbz='2' ";//1��ϵͳȡ��2���˹�¼��
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			rglrtspp=rs.getString(1);
		}
		rs.close();
		ps.close();

		rglrbz="2";//1��ϵͳȡ��2���˹�¼��

		xllbStyle="display:none";
		rglrStyle="display:block";
	}
	else{
		rglrbz="1";//1��ϵͳȡ��2���˹�¼��

		xllbStyle="display:block";
		rglrStyle="display:none";
	}
	//�����˹�¼���־������������������������������������

	//�Ƿ����ü��ɶ���
	ls_sql="select jcppbz";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jcppbz=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	//���� �����޹�Ӧ�� �����򣫣�������������������������������ʼ
	if (tslxbm.equals("12"))
	{
		String gyslb="";
		if (tsxlbm.equals("1201"))//������
		{
			gyslb="2";//1��ľ�ţ�2������3���Ҿߣ�4������
		}
		else if (tsxlbm.equals("1202"))//ľ�ű���
		{
			gyslb="1";//1��ľ�ţ�2������3���Ҿߣ�4������
		}
		else if (tsxlbm.equals("1203"))//���ı���
		{
			gyslb="4";//1��ľ�ţ�2������3���Ҿߣ�4������
		}
		else if (tsxlbm.equals("1204"))//�Ҿ߱���
		{
			gyslb="3";//1��ľ�ţ�2������3���Ҿߣ�4������
		}
		else if (tsxlbm.equals("2301"))//������
		{
			gyslb="2";//1��ľ�ţ�2������3���Ҿߣ�4������
		}
		else if (tsxlbm.equals("2302"))//ľ�ű���
		{
			gyslb="1";//1��ľ�ţ�2������3���Ҿߣ�4������
		}
		else if (tsxlbm.equals("2303"))//�Ҿ߱���
		{
			gyslb="3";//1��ľ�ţ�2������3���Ҿߣ�4������
		}
		else if (tsxlbm.equals("2304"))//�����ı���
		{
			gyslb="4";//1��ľ�ţ�2������3���Ҿߣ�4������
		}

		if (jcppbz.equals("N"))//�Ƿ����ü��ɶ���:Y�����ã�N����
		{
			if (!gyslb.equals(""))
			{
				String tspp=null;

				ls_sql="select distinct jxc_ppgysdzb.ppmc";
				ls_sql+=" from  jxc_ppgysdzb,jxc_ppxx";
				ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm and jxc_ppxx.pplb in('1','3') and jxc_ppgysdzb.ssfgs='"+ssfgs+"' ";
				ls_sql+=" order  by jxc_ppgysdzb.ppmc";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				while (rs.next())
				{
					tspp=rs.getString("ppmc");

					int count=0;
					ls_sql="select count(*)";
					ls_sql+=" from  crm_tsbm";
					ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"' and tspp='"+tspp+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						count=rs1.getInt(1);
					}
					rs1.close();
					ps1.close();

					if (count>0)
					{
						tsppstr+="<option value=\""+tspp+"\" selected>"+tspp+"(����)</option>";	
					}
					else{
						tsppstr+="<option value=\""+tspp+"\">"+tspp+"(����)</option>";	
					}

				}
				rs.close();
				ps.close();
			}
		}
		else{
			//���еĹ�Ӧ����ɾ����Ҫ�Ӷ���ȡ
			String ppmc=null;
			String gys=null;
			String tspp=null;
			if (gyslb.equals("1"))//1��ľ�ţ�2������3���Ҿߣ�4������
			{
				//ľ��
				ls_sql="select distinct pdgcmc,ppmc,gys";
				ls_sql+=" from  jc_mmydd";
				ls_sql+=" where khbh='"+khbh+"' and pdgcmc is not null";
				ls_sql+=" order by pdgcmc";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				while (rs.next())
				{
					tspp=rs.getString("pdgcmc");
					ppmc=rs.getString("ppmc");
					gys=rs.getString("gys");

					int count=0;
					ls_sql="select count(*)";
					ls_sql+=" from  crm_tsbm";
					ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"' and tspp='"+tspp+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						count=rs1.getInt(1);
					}
					rs1.close();
					ps1.close();

					if (count>0)
					{
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\" selected>"+tspp+"(ľ��)</option>";	
					}
					else{
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\">"+tspp+"(ľ��)</option>";	
					}


				}
				rs.close();
				ps.close();
			}
			else if (gyslb.equals("2"))//1��ľ�ţ�2������3���Ҿߣ�4������
			{
				//����
				ls_sql="select distinct pdgcmc,ppmc,gys";
				ls_sql+=" from  jc_cgdd";
				ls_sql+=" where khbh='"+khbh+"' and pdgcmc is not null";
				ls_sql+=" order by pdgcmc";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				while (rs.next())
				{
					tspp=rs.getString("pdgcmc");
					ppmc=rs.getString("ppmc");
					gys=rs.getString("gys");


					int count=0;
					ls_sql="select count(*)";
					ls_sql+=" from  crm_tsbm";
					ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"' and tspp='"+tspp+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						count=rs1.getInt(1);
					}
					rs1.close();
					ps1.close();

					if (count>0)
					{
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\" selected>"+tspp+"(����)</option>";	
					}
					else{
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\">"+tspp+"(����)</option>";	
					}

				}
				rs.close();
				ps.close();
			}
			else if (gyslb.equals("3"))//1��ľ�ţ�2������3���Ҿߣ�4������
			{
				//�Ҿ�
				ls_sql="select distinct pdgcmc,jjppmc,jjgys";
				ls_sql+=" from  jc_jjdd";
				ls_sql+=" where khbh='"+khbh+"' and pdgcmc is not null";
				ls_sql+=" order by pdgcmc";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				while (rs.next())
				{
					tspp=rs.getString("pdgcmc");
					ppmc=rs.getString("jjppmc");
					gys=rs.getString("jjgys");


					int count=0;
					ls_sql="select count(*)";
					ls_sql+=" from  crm_tsbm";
					ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"' and tspp='"+tspp+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						count=rs1.getInt(1);
					}
					rs1.close();
					ps1.close();

					if (count>0)
					{
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\" selected>"+tspp+"(�Ҿ�)</option>";	
					}
					else{
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\">"+tspp+"(�Ҿ�)</option>";	
					}

				}
				rs.close();
				ps.close();

				//�Ͳ���
				ls_sql="select distinct xcmgcmc,xcmgys,xcmppmc";
				ls_sql+=" from  jc_jjdd";
				ls_sql+=" where khbh='"+khbh+"' and xcmgcmc is not null";
				ls_sql+=" order by xcmgcmc";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				while (rs.next())
				{
					tspp=rs.getString("xcmgcmc");
					ppmc=rs.getString("xcmppmc");
					gys=rs.getString("xcmgys");


					int count=0;
					ls_sql="select count(*)";
					ls_sql+=" from  crm_tsbm";
					ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"' and tspp='"+tspp+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						count=rs1.getInt(1);
					}
					rs1.close();
					ps1.close();

					if (count>0)
					{
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\" selected>"+tspp+"(�Ͳ���)</option>";	
					}
					else{
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\">"+tspp+"(�Ͳ���)</option>";	
					}
				}
				rs.close();
				ps.close();
			}
			else if (gyslb.equals("4"))//1��ľ�ţ�2������3���Ҿߣ�4������
			{
				//����
				ls_sql="select distinct ppbm,ppmc,gys";
				ls_sql+=" from  jc_zcdd";
				ls_sql+=" where khbh='"+khbh+"' and ppbm is not null";
				ls_sql+=" order by ppbm";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				while (rs.next())
				{
					tspp=rs.getString("ppbm");
					ppmc=rs.getString("ppmc");
					gys=rs.getString("gys");


					int count=0;
					ls_sql="select count(*)";
					ls_sql+=" from  crm_tsbm";
					ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"' and tspp='"+tspp+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						count=rs1.getInt(1);
					}
					rs1.close();
					ps1.close();

					if (count>0)
					{
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\" selected>"+tspp+"(����)</option>";	
					}
					else{
						tsppstr+="\r\n<option value=\""+tspp+"*"+ppmc+"*"+gys+"\">"+tspp+"(����)</option>";	
					}

				}
				rs.close();
				ps.close();
			}
		}
	}
	//���� �����޹�Ӧ�� ������=========================���

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<html>
<head>
<title>�������ǿͷ��Ǽǵı�����Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%" height="22"> 
      <div align="center">�������ǿͷ��Ǽǵı�����Ϣ�����޼�¼�ţ�<%=tsjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF"> 
              <td width="25%" align="left"> <font color="#0000CC">�ͻ���ţ�</font><%=khbh%> 
              </td>
              <td width="25%"><font color="#0000CC">��ͬ�ţ�</font><%=hth%> </td>
              <td width="25%"> <font color="#0000CC">�ͻ�������</font><%=khxm%></td>
              <td width="25%"><font color="#0000CC">�ʼ�Ա��</font><%=zjxm%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td colspan="2" align="left"><font color="#0000CC">���ݵ�ַ��</font><%=fwdz%> 
              </td>
              <td width="25%"><font color="#0000CC">ʵ�������ڣ�</font><%=sjkgrq%> </td>
              <td width="25%"><font color="#0000CC">ʵ�������ڣ�</font><%=sjjgrq%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="25%" align="left"><font color="#0000CC">ǩԼ���棺</font><%=dwmc%> 
              </td>
              <td width="25%"><font color="#0000CC">���ʦ��</font><%=sjs%> </td>
              <td width="25%"> <font color="#0000CC">ʩ���ӣ�</font><%=sgdmc%> </td>
              <td width="25%"><font color="#0000CC">ʩ�����飺</font><%=sgbz%> </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="25%" align="left"><font color="#0000CC">�طö����־��</font><%
	cf.selectToken(out,"0+δ����&1+���̻طö���&2+���ޱ��޻طö���&3+ȫ������",hfdjbz,true);
%> </td>
              <td width="25%"><font color="#0000CC">�����ˣ�</font><%=djr%> </td>
              <td width="25%"> <font color="#0000CC">����ʱ�䣺</font><%=djsj%></td>
              <td width="25%"><font color="#0000CC">�ƻ��ⶳʱ�䣺</font><%=jhjdsj%> 
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td colspan="4" align="left"><font color="#0000CC">����ԭ��</font><%=djyy%> 
              </td>
            </tr>
          </table>
 
<%
	if (kbxbz.equals("N"))
	{
		%> 
		<script language="javascript">
			var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=180 ><b><font color='#0000CC' class='3dfont' size='4' face='�����п�'>ע�⣡�ÿͻ�[���ܱ���]</font></b></marquee><br>";
			document.write(ie);
		</script>
		<%
	}
	else if (kbxbz.equals("M"))
	{
		%> 
		<script language="javascript">
			var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=180 ><b><font color='#0000CC' class='3dfont' size='4' face='�����п�'>ע�⣡�ÿͻ�[���ֱ���]</font></b></marquee><br>";
			document.write(ie);
		</script>
		<%
	}
	else if (kbxbz.equals("0"))
	{
		%> 
		<script language="javascript">
			var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=180 ><b><font color='#0000CC' class='3dfont' size='4' face='�����п�'>ע�⣡�ÿͻ�[δ������]</font></b></marquee><br>";
			document.write(ie);
		</script>
		<%
	}
	else if (kbxbz.equals("Y") && syts<0)
	{
		%> 
		<script language="javascript">
			var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=180 ><b><font color='#0000CC' class='3dfont' size='4' face='�����п�'>ע�⣡�ÿͻ������ѹ��ڣ����޽�ֹʱ�䣺"+bxjzsj+"</font></b></marquee><br>";
			document.write(ie);
		</script>
		<%
	}


%>
		  
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF"> 
              <td width="29%"> <font color="#0000CC">�ɱ��ޱ�־</font>��<%
	cf.selectToken(out,"Y+����&M+���ֱ���&N+������&0+δ����&1+Ԥ������",kbxbz,true);
%> </td>
              <td width="30%"><font color="#0000CC">���޿�ʼʱ��</font>��<%=bxkssj%></td>
              <td width="30%"><font color="#0000CC">���޽�ֹʱ��</font>��<%=bxjzsj%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td colspan="3"><%=bybxsm%></td>
            </tr>
          </table>
<P>		  
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF" align="center"> 
              <td colspan="4" height="25"><b>����Ϊ[<%=lrr%>]¼��ı�����Ϣ</b></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>�ֻ���<font color="#FF0000">���޸�</font>��</td>
              <td colspan="3"> 
                <input type="text" name="lxfs" value="<%=lxfs%>" size="40" maxlength="50">
                <font color="#FF0000">���ڽ��ն��ţ����¼һ��,�ж���绰<font color="#0000FF">��Ӣ�Ķ���</font>�ָ�</font>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">�����绰��<font color="#FF0000">���޸�</font>��</td>
              <td colspan="3"> 
                <input type="text" name="qtdh" value="<%=qtdh%>" size="40" maxlength="50">
                <font color="#FF0000">(ע�⣺�ж���绰<font color="#0000FF">��Ӣ�Ķ���</font>�ָ�)</font>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">�����ʼ���<font color="#FF0000">���޸�</font>��</td>
              <td colspan="3"> 
                <input type="text" name="email" value="<%=email%>" size="40" maxlength="50">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>������Դ</td>
              <td width="29%"> 
                <select name="slfsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm order by slfsbm",slfsbm);
%> 
                </select>              </td>
              <td width="17%" align="right"><font color="#FF0033">*</font>�ͻ�����ʱ��</td>
              <td width="37%"> 
                <input type="text" name="tsbxsj" value="<%=tsbxsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font><font color="#0000CC">¼����</font></td>
              <td width="29%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>              </td>
              <td width="17%" align="right"><font color="#FF0033">*</font><font color="#0000CC">¼��ʱ��</font></td>
              <td width="37%"> 
                <input type="text" name="lrsj" value="<%=lrsj%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>��������</td>
              <td colspan="3"> 
                <textarea name="tsnr" cols="73" rows="5"><%=tsnr%></textarea>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">Ҫ����ʱ��</td>
              <td width="29%"> 
                <input type="text" name="yqjjsj" size="20" maxlength="10"  value="<%=yqjjsj%>" >              </td>
              <td width="17%" align="right">ά��ʩ����</td>
              <td width="37%"> 
                <input type="text" name="wxsgd" value="<%=wxsgd%>" size="20" maxlength="30" >              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="73" rows="2"><%=bz%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="4" height="28"><b><font color="#0000FF">��������ʱ����ע��������Ϣ�Ƿ���ȷ����</font><%=txxx%></b></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"><font color="#FF0033">*</font><font color="#0000CC">�ͷ�������</font></td>
              <td width="29%"> 
                <input type="text" name="slr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="17%" align="right"><font color="#FF0033">*</font><font color="#0000CC">�ͷ�����ʱ��</font></td>
              <td width="37%"> 
                <input type="text" name="slsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>���˹�֪ͨ���β���</td>
              <td width="29%"><%
					cf.radioToken(out, "sfxtz","Y+��֪ͨ&N+����֪ͨ","");
				%></td>
              <td width="17%" align="right"><font color="#FF0033">*</font>�Ƿ�����</td>
              <td width="37%"> <%
					cf.radioToken(out, "sfla","Y+��&N+��","");
				%> </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0033">*</font>�Ƿ����ڲ�����</td>
              <td><%
	cf.radioToken(out, "sfxnbgz","Y+��ط�&N+����ط�",sfxnbgz);
%></td>
              <td align="right">�ڲ�����ʱ��</td>
              <td><input name="nbgzsj" type="text" value="<%=nbgzsj%>" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font>�Ƿ���ط�</div>              </td>
              <td width="29%"> <%
	cf.radioToken(out, "sfxhf","Y+��ط�&N+����ط�","");
%> </td>
              <td width="17%"> 
                <div align="right">�ط�ʱ��</div>              </td>
              <td width="37%"> 
                <input type="text" name="hfsj" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="4"><b>ע�⣺����¼������������ԭ�򡻣���ͨ����<font color="#0000CC">¼�����ԭ��</font>����ťһ��¼�����ԭ��</b></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>���޴���</td>
              <td width="29%"> 
                <select name="tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getXlItem(insertform)">
                  <option value=""></option>
                  <%
	   cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm where tsdl='1' order by tslxbm",tslxbm);
%> 
                </select>              </td>
              <td width="17%" rowspan="6" align="right" valign="top">�漰����</td>
              <td width="37%" rowspan="6" valign="top"> 
				  <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="xllb" style="<%=xllbStyle%>">
					<tr>
					  <td >
						<select name="tspp" style="FONT-SIZE:12PX;WIDTH:252PX" >
						  <option value=""></option>
						  <%=tsppstr%> 
						</select>					  </td>
					</tr>
				  </table>

				  <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="rglr" style="<%=rglrStyle%>">
					<tr>
					  <td >
						<input type="text" name="rglrtspp" value="<%=rglrtspp%>" size="34" maxlength="50" >					  </td>
					</tr>
				  </table>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>����С��</td>
              <td width="29%"> 
                <select name="tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getYyItem(insertform)">
                  <option value=""></option>
                  <%
	   cf.selectItem(out,"select tsxlbm,tsxlmc from dm_tsxlbm where tslxbm='"+tslxbm+"' order by tsxlbm",tsxlbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>����ԭ��</td>
              <td width="29%"> 
                <select name="tsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	   cf.selectItem(out,"select tsyybm,tsyymc from dm_tsyybm where tsxlbm='"+tsxlbm+"' order by tsyybm",tsyybm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td width="17%" align="right"><font color="#FF0033">*</font>���β���</td>
              <td width="29%">
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getZrbm(insertform)">
                  <option value=""></option>
                  <%
	String sql="select sq_tsclbm.dwbh,a.dwmc||'��'||b.dwmc||'��' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+ssfgs+"' order by sq_tsclbm.dwbh";
	cf.selectItem(out,sql,tsbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0033">*</font>������</td>
              <td><select name="ygbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select ygbh,yhmc||'('||xzzwbm||')' from sq_yhxx where sq_yhxx.sfzszg in('Y','N') and dwbh='"+tsbm+"' order by yhmc",ygbh);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">�漰����</td>
              <td width="29%">
<%
	if (zdyhbz.equals("Y"))
	{
		%> 
		<input type="radio" name="rglrbz" value="1" <% if (rglrbz.equals("1")) out.print("checked");%> onClick="xllb.style.display ='block';rglr.style.display ='none';">
		�������б�ѡ 
		<input type="radio" name="rglrbz" value="2" <% if (rglrbz.equals("2")) out.print("checked");%> onClick="xllb.style.display ='none';rglr.style.display ='block';">
		�˹�¼�� 
		<%
	}
	else{
		%> 
		<input type="radio" name="rglrbz" value="1" checked >
		�������б�ѡ 
		<%
	}
%>			  </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="hidden" name="slbm" value="<%=slbm%>">
                  <input type="hidden" name="tsjlh"  value="<%=tsjlh%>" >
                  <input type="hidden" name="jcppbz"  value="<%=jcppbz%>" >
                  <input type="hidden" name="ssfgs"  value="<%=ssfgs%>" >
                  <input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="hidden" name="wheretsyybm"  value="<%=tsyybm%>" >
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="button"  value="¼�����ԭ��" onClick="f_lr(insertform)" name="lr" >
                  <input type="button"  value="�鿴����ԭ��" onClick="f_ck(insertform)" name="ck" >
                  <input type="reset"  value="����">
                </div>              </td>
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
	//����Ajax
	cf.ajax(out);
%>

var czlx;

function getXlItem(FormName)
{
	if (FormName.tslxbm.value=='')
	{
		return;
	}

	czlx=1;

	FormName.tsxlbm.length=1;
	FormName.tsyybm.length=1;
	FormName.tspp.length=1;
	FormName.dwbh.value="";

	var actionStr="/tsgl/tsdj/InsertCx.jsp?jcppbz=<%=jcppbz%>&ssfgs=<%=ssfgs%>&khbh=<%=khbh%>&tslxbm="+FormName.tslxbm.value;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getYyItem(FormName)
{
	if (FormName.tsxlbm.value=='')
	{
		return;
	}

	czlx=2;

	FormName.tsyybm.length=1;

	var actionStr="/tsgl/tsdj/InsertCx.jsp?jcppbz=<%=jcppbz%>&ssfgs=<%=ssfgs%>&khbh=<%=khbh%>&tsxlbm="+FormName.tsxlbm.value;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getZrbm(FormName)
{
	if (FormName.dwbh.value=='')
	{
		return;
	}

	FormName.ygbh.length=1;

	czlx=3;

	var sql="select ygbh,yhmc||'('||xzzwbm||')' from sq_yhxx where sq_yhxx.sfzszg in('Y','N') and dwbh='"+FormName.dwbh.value+"' order by yhmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;
	
	openAjax(actionStr);

//	window.open(actionStr);
	openAjax(actionStr);
}



function getAjax(ajaxRetStr) 
{
	if (czlx==1)
	{
		insertform.tsxlbm.length=1;
		var value1=getStrValue(ajaxRetStr,1);
		strToSelect(insertform.tsxlbm,value1);
	}
	else if (czlx==2)
	{
		insertform.tsyybm.length=1;
		var value3=getStrValue(ajaxRetStr,3);
		strToSelect(insertform.tsyybm,value3);

		insertform.tspp.length=1;
		var value4=getStrValue(ajaxRetStr,4);
		strToSelect(insertform.tspp,value4);
	}
	else if (czlx==3)
	{
		strToSelect(insertform.ygbh,ajaxRetStr);
	}
}

function f_change(FormName)//����FormName:Form������
{
	if (FormName.sfxhf.value=="N")
	{
		FormName.hfsj.value="";
	}
	else if (FormName.sfxhf.value=="Y"){
		if (("<%=hfdjbz%>"=="Y") && ("<%=jhjdsj%>">"<%=cf.today()%>"))
		{
			alert("���󣬻ط��ѱ����ᣡ");
			FormName.sfxhf.value="";
			FormName.sfxhf.focus();
			return false;
		}
	}
}


function f_do(FormName)//����FormName:Form������
{

	if(	javaTrim(FormName.tsjlh)=="") {
		alert("��ѡ��[���޼�¼��]��");
		FormName.tsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.slfsbm)=="") {
		alert("��ѡ��[������Դ]��");
		FormName.slfsbm.focus();
		return false;
	}

	if(	javaTrim(FormName.tsnr)=="") {
		alert("��ѡ��[��������]��");
		FormName.tsnr.focus();
		return false;
	}

	if(FormName.tsnr.value.length>400)
	{
		var length=FormName.tsnr.value.length;
		alert("����[��������]���ܳ���400���֣�Ŀǰ����"+length+"���֣������¼��");
		FormName.tsnr.focus();
		return false;
	}

	if(!(isDatetime(FormName.yqjjsj, "Ҫ����ʱ��"))) {
		return false;
	}
	
	if(	!radioChecked(FormName.sfxtz)) {
		alert("��ѡ��[���˹�֪ͨ���β���]��");
		FormName.sfxtz[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfla)) {
		alert("��ѡ��[�Ƿ�����]��");
		FormName.sfla[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxnbgz)) {
		alert("��ѡ��[�Ƿ����ڲ�����]��");
		FormName.sfxnbgz[0].focus();
		return false;
	}
	if (FormName.sfxnbgz[0].checked)
	{
		if(	javaTrim(FormName.nbgzsj)=="") {
			alert("������[�ڲ�����ʱ��]��");
			FormName.nbgzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.nbgzsj, "�ڲ�����ʱ��"))) {
			return false;
		}
	}
	else{
		FormName.nbgzsj.value="";
	}
	if(	!radioChecked(FormName.sfxhf)) {
		alert("��ѡ��[�Ƿ���ط�]��");
		FormName.sfxhf[0].focus();
		return false;
	}

	if (FormName.sfxhf[0].checked)
	{
		if(	javaTrim(FormName.hfsj)=="") {
			alert("������[�ط�ʱ��]��");
			FormName.hfsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.hfsj, "�ط�ʱ��"))) {
			return false;
		}
	}
	else{
		FormName.hfsj.value="";
	}

	if(	javaTrim(FormName.tsbxsj)=="") {
		alert("������[�ͻ�����ʱ��]��");
		FormName.tsbxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tsbxsj, "�ͻ�����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.slr)=="") {
		alert("������[�ͷ�������]��");
		FormName.slr.focus();
		return false;
	}
	if(	javaTrim(FormName.slsj)=="") {
		alert("������[�ͷ�����ʱ��]��");
		FormName.slsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.slsj, "�ͷ�����ʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.slbm)=="") {
		alert("������[¼�벿��]��");
		FormName.slbm.focus();
		return false;
	}

	if(	javaTrim(FormName.tslxbm)=="") {
		alert("��ѡ��[���޴���]��");
		FormName.tslxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsxlbm)=="") {
		alert("��ѡ��[����С��]��");
		FormName.tsxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsyybm)=="") {
		alert("��ѡ��[����ԭ��]��");
		FormName.tsyybm.focus();
		return false;
	}

	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[���β���]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("��ѡ��[������]��");
		FormName.ygbh.focus();
		return false;
	}

/*
	if (FormName.tslxbm.value=="12")
	{
		<%
		if (zdyhbz.equals("Y"))
		{
			%> 
			if (FormName.rglrbz[0].checked)//�������б�ѡ
			{
				if(	javaTrim(FormName.tspp)=="") {
					alert("����б���ѡ��[�漰����]�����б��в����ڣ���ѡ���˹�¼�롿��");
					FormName.tspp.focus();
					return false;
				}
			}
			else{
				if(	javaTrim(FormName.rglrtspp)=="") {
					alert("���˹�¼��[�漰����]��");
					FormName.rglrtspp.focus();
					return false;
				}
			}
			<%
		}
		else{
			%> 
			if(	javaTrim(FormName.tspp)=="") {
				alert("����б���ѡ��[�漰����]��");
				FormName.tspp.focus();
				return false;
			}
			<%
		}
		%>
	}
*/


	FormName.action="SaveSlEditCrm_tsjl.jsp";
	FormName.target="";
	FormName.submit();
	return true;
}

function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("��ѡ��[���޼�¼��]��");
		FormName.tsjlh.focus();
		return false;
	}

	FormName.action="InsertCrm_tsbm.jsp";
	FormName.target="_balnk";
	FormName.submit();
	return true;
}
function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("��ѡ��[���޼�¼��]��");
		FormName.tsjlh.focus();
		return false;
	}

	FormName.action="Crm_tsbmList.jsp";
	FormName.target="_balnk";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
