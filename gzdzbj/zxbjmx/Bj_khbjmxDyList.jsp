<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String xh=null;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String oldjgwzmc="";
String jldwmc=null;
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
double zjqye=0;
double xjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;

String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;


try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
	}
	rs.close();
	ps.close();


	//��ʼ��
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//��ȡ���ӱ��۽��
	zjqye=dzbj.getBjje(conn,khbh,"hd");
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center">
  <table width="100%" border="0">
    <tr> 
      <td width="48%" rowspan="2"><span lang=EN-US><img src="../../images/tubiao.jpg" v:shapes="_x0000_i1025"></span><br></td>
	  <td width="20%" rowspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      <td width="" style='FONT-SIZE: 14px'>��˾(�ܲ�)��ַ�������л��ȳǺ��ƴ�����¥  
    </tr>
    <tr>
     <td style='FONT-SIZE: 14px'>  �绰��0755-26948699 &nbsp;&nbsp;&nbsp; 0755-26948389   
    </tr>
    <tr>
      <td width="48%" style='FONT-SIZE: 19px'>http://www.szhaida.com</td>
       <td style='FONT-SIZE: 14px'> ���棺0755-26948608
    </tr>
    <tr> 
      <td colspan="4" >
        <div align="center">
          <hr>
          <b><font size="5">���̱��۵�</font></b></div>
      </td>
    </tr>
  </table>
</div>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td>�ͻ�������<%=khxm%></td>
    <td>��ϵ��ʽ��<%=lxfs%></td>
    <td>����ܼƣ�<%=cf.formatDouble(zjqye,"#########.##")%>Ԫ</td>
  </tr>
  <tr> 
    <td>���̵ص㣺<%=fwdz%></td>
    <td>�� �� ʦ��<%=sjs%></td>
    <td>���̵ȼ���<%=bjjb%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
<tr> 
    <td  colspan="2" align="center"><b><font size="3">��  ��  ��  ��</font></b>	</td>
    
    
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center">һ</td>
    
    <td>�˱�����Ϊ��˾����װ�ε�ָ������,�����Ѷȴ����ƻ�ŷʽ���Ӧ�ڴ���Ŀ���۵Ļ��������ϸ�����������ϸ����ܳ���50%�������г��۸�仯���˱��ۿ���ÿ�½���һ��΢������ͬǩ��ʱ�ĵ��۱��������¹����ı���Ϊ׼��</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center">��</td>
    
    <td>ʩ��������©�������Ŀ,Ӧ��©�������Ŀ����������,��ʵ�ʷ�����������Ԥ�㵥�Ϲ��̵���Ϊ׼�������ֳ�ǩ֤����˫��ǩ���Ͽ�Ϊ���ݽ��н��㡣��Ԥ�����û�����������Ŀ���ۣ�����˾�����ƶ��Ĺ��̱��۱��ϵļ۸�Ϊ׼��</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center">��</td>
    
    <td>�ͻ�װ�޷��ݵ��κι��������ҷ�ʩ����������������Ӱ���ҷ�ʩ���������ǲ�ж����������������취����ҵ����е����á�	</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center">��</td>
    
    <td>�˱��۲������ּ���ͷ���ƾߡ���ߡ����ߡ���Ƭ����ש������ʯ��ľ�ذ弰Ԥ�㵥��ҵ��Ҫ���Թ��Ĳ��ϡ�</td>
  </tr>

  <tr> 
    <td  WIDTH="3%" align="center">��</td>
    
    <td>�˱��۲������������շѣ��ҹ�˾ֻ����۾ֹ涨װ�ι�˾���ɵ�װ��Ѻ��͹��˳���֤���á������������������շ���Ŀ���������˷��ã�������ʩά���ѣ����˳��������ã��ֳ�ʩ��ˮ��ѵȣ���Ԥ���ھ����������ڣ���ҵ�����и���</td>
  </tr>
  <tr> 
    <td  colspan="2" align="center"><b><font size="3">ͨ�ò��ϱ���˵��	</font></b>	</td>
     </tr>
<tr> 
    <td  WIDTH="3%" align="center">����
</td>
    
    <td>�������ΰҵ������15mm��ܡ���塣���汳��Ϊΰҵ������5mm�壨����9mm�����20Ԫ��M2����������3mm����PVC�沨����(��������������貹���45-65Ԫ/M2)������12mm�������ſ�ܣ���������3mm����PVC�沨���壬����������壬ʵľ������ߡ���̩�����۳��뻬�죬��̩���̶��£������������������������ö��������Ų���̨����ڹ�������ڳ��밴1����M2Ϊ��׼������������80Ԫ���������������밵������ҵ��Ҫ�������ò��ϣ��벹��ۡ�	</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center">����</td>
    
    <td>ʵо�����Ų���ΰҵ������12mm��9mm������ƴ�����͡�ƽ���Ų��ó���12mm��������ܣ�ΰҵ������5mm���˫���Ű壬��������壬ʵľ������ߣ���̩������ַ��ź�ҳ�������������������ö���������������ľ�����Ų��ó���12mm�����߿��żܣ�ʵľ�������У�5mm��ͨ������ֵ50Ԫ/M2������������������ۡ������Ź����ƣ�����̨���������������������������֡�</td>
  </tr>
 
  <tr> 
    <td  WIDTH="3%" align="center">�ſ�</td>
    
    <td>����ΰҵ������9mm���ף������ڻ�������壬60mm��8mmʵľ����ѹ�ߣ�������ö�����ʵľ�߳�����Ȱ�15Ԫ��20mm�ƣ��ſ���Ϊ200mm��������ơ�	</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center">����</td>
    
    <td>ľ�ذ��������ΰҵ������9mm�忪�����150mm��ף�������������ҵ���Թ�ľ�ذ塣����ש���÷���R3.25ˮ�����ɰ��1��3����ɰ����ҵ���Թ����ġ�ľ�Ƶ�̨����ΰҵ������12mm������ǲ㣬����ΰҵ������12mm���棬�������ذ�İ�װ�������������ˮ������úڱ��ۺ���ˮ������Ϸ�ˮ����ǽ������ˢ���顣</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center">�컨</td>
    
    <td>��ʽ�������ʹ�����35mm��25mmɼľ�������Ǽܣ�ΰҵ������9mm�����ͣ�����˫��ΰҵ������5mm��,ˢ�����ᰴ25Ԫ/M2�Ƽۡ�ƽʽ�������ֲ���9mm���͸���̩ɽֽ��ʯ��塣���ް嶥�����۰嶥����������ǲ������ͼ�,���Ͻ�߽ǡ������������ˢͿ�ϣ�������·���ú͵ƾߡ����渴ʽ������չ�������,�ܱߵ��������߲���500mm���ӳ��׼��㣬�����水����߲�����	</td>
  </tr>

  <tr> 
    <td  WIDTH="3%" align="center">ǽ��</td>
    
    <td>��оש��̩�ذ彨ǽ���÷���R3.25ˮ�����ɰ��1��3ˮ��ɰ������˫��������ľ��ǽ����ΰҵ������12mm���ǿ�ܣ�˫����ΰҵ������9mm�壬��Ÿ��������50Ԫ��M2�����������ҡ�Ϳ�ϡ�</td>
  </tr>

  <tr> 
    <td  WIDTH="3%" align="center">ľ����</td>
    
    <td>���ú����������᲻�������飬�������᲻�������顣</td>
  </tr>


  <tr> 
    <td  WIDTH="3%" align="center">Ϳ��</td>
    
    <td>ǽ��˫�ɷۣ��콺�ۣ������ƻ������齺���������Ҵ�ĥ��ƽ����Ϳ�齺��һ�����档��ʹ�÷ǰ�ɫ�齺�ᣬ����������������2Ԫ/ƽ�������Ա�ע˵��Ϊ׼����ëǽ�����3Ԫ��M2������ԭǽ��Ϳ�����3Ԫ��M2  �������ԭ����ɳ�������������м��㣬��ֻ��ǽ����������ƽ18Ԫ��M2 ��</td>
  </tr>
 <tr> 
    <td  WIDTH="3%" align="center">��·</td>
    
    <td>ǿ����û��»������оǿ����ߣ�2.5mm2-4mm2��������16mm-20mmPVC�ܣ��������ᡢ���У���ͷ����ͨ�������������Ϊһ�飬���е������Ӵ��������õ¹�WAGO��˾�����ĵ��ɼг�������(���������)���ӡ����粿�ֲ���˫Ƶ�����ߡ�����100-200о�����ߡ�������4о�绰�ߣ�TCL���磬����һ��Ϊһ�飬ÿ����һ�������3Ԫ��M����ṹ���ƣ����沿�ֿɲ�����ȼ��ܻ��ף��۸񲻱䡣</td>
  </tr>
   <tr> 
    <td  WIDTH="3%" align="center">ˮ·
</td>
    
    <td>������PPR20mm-25mm����ˮ��������շ������ܹ�20mm-25mm����ˮ�ܡ������������</td>
  </tr>

</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"> 
    <td  width="3%" align="center">���</td>
    <td  width="9%" align="center">��Ŀ���</td>
    <td  width="15%" align="center">��Ŀ����</td>
    <td  width="7%" align="center">��λ</td>
    <td  width="8%" align="center">���ۣ�Ԫ��</td>
    <td  width="6%" align="center">����</td>
    <td  width="8%" align="center">��Ԫ��</td>
    <td  width="44%" align="center">��������������˵��</td>
  </tr>

<%
	int i=0;
	ls_sql="SELECT bj_fjxx.jgwzbm";
	ls_sql+=" FROM bj_fjxx ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by bj_fjxx.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		
		//�������
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="8"> 
			  <div align="center"><b><i><font size="3">�ṹλ�ã�<%=jgwzmc%></font></i></b></div>
			</td>
		  </tr>
		<%

		//�����Ŀ��ϸ
		double zcf=0;
		double fcf=0;
		double rgf=0;
		double jjf=0;
		double glfbl=0;
		String bjlx=null;
		String sfxycl=null;

		xjsl=0;
		xjqye=0;

		ls_sql="SELECT bj_bjxmmx.xh xh,bjlx,sfxycl,trim(bj_bjxmmx.xmbh)||DECODE(bjlx,'1','','2','��') xmbh,xmmc,jldwmc,bj_bjxmmx.dj,bj_gclmx.sl,gycl,bj_dwgclzcyl.zcf,bj_bjxmmx.fcf,bj_bjxmmx.rgf,bj_bjxmmx.jjf,bj_bjxmmx.glfbl";
		ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx,bj_dwgclzcyl,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" and bj_gclmx.khbh=bj_dwgclzcyl.khbh(+) and bj_gclmx.dqbm=bj_dwgclzcyl.dqbm(+) and bj_gclmx.xmbh=bj_dwgclzcyl.xmbh(+) and bj_gclmx.jgwzbm=bj_dwgclzcyl.jgwzbm(+)";
		ls_sql+=" order by bj_bjxmmx.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			bjlx=cf.fillNull(rs.getString("bjlx"));
			sfxycl=cf.fillNull(rs.getString("sfxycl"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
//			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));

			zcf=rs.getDouble("zcf");
			fcf=rs.getDouble("fcf");
			rgf=rs.getDouble("rgf");
			jjf=rs.getDouble("jjf");
			glfbl=rs.getDouble("glfbl");

			if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ
			{
				if (sfxycl.equals("1"))//1����Ҫ��2������Ҫ
				{
					dj=(int)((zcf+fcf+rgf+jjf)*(100+glfbl)+0.5)/100.0;
				}
			}

			qye=sl*dj;


			xjsl+=sl;
			xjqye+=qye;
			allsl+=sl;
			allqye+=qye;



			row++;
			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td align="center" width="4%"><%=row%></td>
				<td align="center" width="7%"><%=xmbh%></td>
				<td align="center" width="15%"><%=xmmc%></td>
				<td align="center" width="7%"><%=jldwmc%></td>
				<td align="center" width="8%"><%=cf.formatDouble(dj)%></td>
				<td align="center" width="6%"><%=cf.formatDouble(sl)%></td>
				<td align="center" width="8%"><%=cf.formatDouble(qye,"#########.##")%></td>
				<td align="left" width="45%"><%=gycl%></td>
			  </tr>
			<%
		}
		ps.close();
		rs.close();

		//���С��
		%> 
		  <tr bgcolor="#FFFFFF" align="right"> 
			<td colspan="8"><b><i><font size="3"><%=oldjgwzmc%>С�ƣ�<%=cf.formatDouble(xjqye,"#########.##")%>Ԫ&nbsp;&nbsp;&nbsp;&nbsp;</font></i></b></td>
		  </tr>
		<%
	
	}
	rs1.close();
	ps1.close();
%> 
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5"> 
      <div align="center"><b><i><font size="3">�����շ���Ŀ</font></i></b></div>
    </td>
  </tr>
  <%  
	double sfje=0;
	double allsfje=0;
	String sfxmmc=null;
	String bz=null;
	ls_sql="SELECT sfxmmc,sfje,bz";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		sfje=rs.getDouble("sfje");

		allsfje+=sfje;

		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td align="center" width="11%" >&nbsp;</td>
			<td align="center" width="15%" ><%=sfxmmc%></td>
			<td align="center" width="21%" >&nbsp;</td>
			<td align="center" width="8%"><%=cf.formatDouble(sfje,"#########.##")%></td>
			<td align="left" width="45%"><%=bz%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();
%> 
  <tr bgcolor="#FFFFFF" align="right"> 
    <td colspan="5"><i><b><font size="3">�����շ�С�ƣ�<%=cf.formatDouble(allsfje,"#########.##")%>Ԫ&nbsp;&nbsp;&nbsp;&nbsp;</font></b></i></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr> 
    <td height="33">�׷�ǩ�֣�</td>
    <td height="33">�ҷ�ǩ�֣�</td>
  </tr>

</table>
<br>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>

  <tr> 
    <td  WIDTH="3%" align="center">ע:</td>
    
    <td align="center" colspan="4">ľ��Ʒ�۸��ַ�Ϊ�����ۣ�����ľ���</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center"></td>
    
    <td colspan="4">�����۰�����ӣ��ľ��壯��������������壯���������ˮ������壯ˮ��������������ľ��壯�Ƽ�ľ������ɳ������壯ɳ����������</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center"></td>
    
    <td colspan="4">����ľ��۰���������ľ��壯����ľ�������������壯�����������������壯��ľ������ɫ��ɨ�ᣬ��ľ��壯��ľ��������ľ��壯��ľ������ӣ��ľ��壯ӣ��ľ������</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center"></td>
    
    <td colspan="4">��ľ���/��ľ������ľ�����ּ۸����ں���ľ��۸�����ϸ�3%��</td>
  </tr>

  <tr> 
    <td  WIDTH="3%" align="center">��1</td>
    
    <td colspan="4">��ҵ��Ҫ���������ϲ����õ�����壬Ҫ���ݸ�������г��۸���л��㣬�ֱ������۸��ݶ�65.00Ԫ/�š�</td>
  </tr>
  
<tr> 
    <td  WIDTH="3%" align="center">��2
</td>
    
    <td colspan="4">�����������Ҫ����ɫ���մ�������ʵ��չ������㣬ÿƽ���ײ���35.00Ԫ(ע������������ˢ�����������ɫ��Ʒ�)��</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center">��3</td>
    
    <td colspan="4">�˱����ǹ�����Ŀ���������õĻ����۸�,�������⹤��Ҫ�����ƺ����ߵ���Ŀ���Ӹ��ӳ̶ȸߵͶ�λ��</td>
  </tr>
 
  <tr> 
    
    
    <td colspan="5">��ͥ��װ��ʵ�������շѱ�׼	</td>
	</tr>

<tr> 
    <td  WIDTH="3%" align="center">1</td>
    
    <td>���ز�����װ	</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>5.00 
</td>
	 <td>ֻ�˹����ϣ��ƾ�,���ز����ࣩ	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">2</td>
    
    <td>����ư�װ	</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>100.00 
	</td>
	 <td>ֻ�˹����ϣ��ƾ�,���ز����ࣩ
</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">3</td>
    
    <td>С���ư�װ
	</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>40.00 
</td>
	 <td>ֻ�˹����ϣ��ƾ�,���ز����ࣩ
</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">4</td>
    
    <td>�����ư�װ
	</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>25.00 
	</td>
	 <td>ֻ�˹����ϣ��ƾ�,���ز����ࣩ
	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">5</td>
    
    <td>�ڵƣ�����ƣ���ǰ�ư�װ
	</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>25.00 
	</td>
	 <td>ֻ�˹����ϣ��ƾ�,���ز����ࣩ
	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">6</td>
    
    <td>�ƹ�֧�ܰ�װ
	</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>15.00 
	</td>
	 <td>ֻ�˹����ϣ��ƾ�,���ز����ࣩ
	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">7</td>
    
    <td>Ͳ�ƣ���ư�װ
	</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>15.00 
	</td>
	 <td>ֻ�˹����ϣ��ƾ�,���ز����ࣩ
	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">8</td>
    
    <td>�ƴ�
	</td>
	 
    <td  WIDTH="" align="center">M
</td>
    
    <td>15.00 
	</td>
	 <td>ֻ�˹����ϣ��ƾ�,���ز����ࣩ
	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">9</td>
    
    <td>�Խ�����װ
</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>20.00 
	</td>
	 <td>ֻ�˹����ϣ��ƾ�,���ز����ࣩ
	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">10</td>
    
    <td>���尲װ

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>20.00 
	</td>
	 <td>ֻ�˹����ϣ��ƾ�,���ز����ࣩ

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">11</td>
    
    <td>�����Ȱ�װ

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>35.00 

	</td>
	 <td>ֻ�˹����ϣ�����ࣩ

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">12</td>
    
    <td>��ˮ����װ

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>60.00 

	</td>
	 <td>ֻ�˹����ϣ�����ࣩ

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">13</td>
    
    <td>ˮ������װ

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>25.00 

	</td>
	 <td>ֻ�˹����ϣ�����ࣩ

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">14</td>
    
    <td>��������װ

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>80.00 
 
	</td>
	 <td>ֻ�˹����ϣ�����ࣩ

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">15</td>
    
    <td>ë��ܰ�װ

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>15.00 

	</td>
	 <td>ֻ�˹����ϣ�����ࣩ

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">16</td>
    
    <td>��ֽ�а�װ

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>10.00 
 
	</td>
	 <td>ֻ�˹����ϣ�����ࣩ

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">17</td>
    
    <td>ϴ���Ҿ߰�װ

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>15.00 
 
	</td>
	 <td>ֻ�˹����ϣ�����ࣩ

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">18</td>
    
    <td>����ˮ��ͷ��װ

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>15.00 
 
	</td>
	 <td>ֻ�˹����ϣ�����ࣩ

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">19</td>
    
    <td>����ˮ��ͷ��װ

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>25.00 

	</td>
	 <td>ֻ�˹����ϣ�����ࣩ

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">20</td>
    
    <td>̨��ϴ���谲װ

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>25.00 
 
	</td>
	 <td>ֻ�˹����ϣ�����ࣩ
��
	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">21</td>
    
    <td>��ʽϴ���谲װ

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>30.00 
 
	</td>
	 <td>ֻ�˹����ϣ�����ࣩ

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">22</td>
    
    <td>������ԡ����װ

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>150.00 

	</td>
	 <td>ֻ�˹����ϣ�����ࣩ

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">23</td>
    
    <td>װ�ιҼ���װ

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>10.00 

	</td>
	 <td>ֻ�˹����ϣ���𡢹Ҽ��ࣩ

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">24</td>
    
    <td>������װ

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>25.00 

	</td>
	 <td>ֻ�˹����ϣ���𡢹Ҽ��ࣩ

	</td>
	
	</tr>
	<tr> 
    <td  colspan="5" align="center">���ڼ�ͥ��װ��Ŀ��Χ��װ����				
</td>
    
    

	
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">1</td>
    
    <td>ԡ�װ�װ

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>250.00 
 
	</td>
	 <td>ҵ���Թ����ģ��˹���װ��

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">2</td>
    
    <td>������԰��

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>40.00 
 
	</td>
	 <td>ֻ�˹�����

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">3</td>
    
    <td>רҵ��ǽ��

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>50.00 

	</td>
	 <td>ֻ�˹�����

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">4</td>
    
    <td>רҵ��������ǽ�����

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>80.00 

	</td>
	 <td>ֻ�˹�����

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">5</td>
    
    <td>�ײް�װ

</td>
	 
    <td  WIDTH="" align="center">��</td>
    
    <td>180.00  
	</td>
	 <td>
ֻ�˹�����

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">ע
</td>
    
    <td colspan="4">���ϼ۸���Ѻ�����˰��			


	</tr>
	
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
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