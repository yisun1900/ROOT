<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String hfbm=(String)session.getAttribute("dwbh");
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

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

String djbh=null;
String hfdjbz=null;
String djyy=null;
String djsj=null;
String djr=null;
String jhjdsj=null;

String gcjdbm=null;
String zt=null;

String kbxbz=null;
String bxkssj=null;
String bxjzsj=null;
String bybxsm=null;
int syts=0;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String lx=cf.GB2Uni(request.getParameter("lx"));
String lxsql="";
if (lx!=null)
{
	if (!(lx.equals("null")))	lxsql=" and  (crm_tsjl.lx='"+lx+"')";
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
String wheresql="";
String hfjlh=null;
try {
	conn=cf.getConnection();

	ls_sql="select zt,gcjdbm,kbxbz,bxkssj,bxjzsj,bybxsm,bxjzsj-SYSDATE syts,khxm,fwdz,lxfs,qtdh,crm_khxx.email,crm_khxx.dwbh,dwmc,sjs,crm_khxx.sgd,sgdmc,zjxm,hth,sjkgrq,sjjgrq,djbh,hfdjbz,djyy,djsj,djr,jhjdsj,sgbz,fgsbh";
	ls_sql+=" from  crm_khxx,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));

		kbxbz=cf.fillNull(rs.getString("kbxbz"));
		bxkssj=cf.fillNull(rs.getDate("bxkssj"));
		bxjzsj=cf.fillNull(rs.getDate("bxjzsj"));
		bybxsm=cf.fillNull(rs.getString("bybxsm"));
		syts=rs.getInt("syts");

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
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where khbh='"+khbh+"' and clzt='0' ";//0��δ����1��������2���ڴ���3���᰸��9:������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("���󣡸ÿͻ���δ�����Ͷ�߱��޼�¼���������������ܻط�");
		return;
	}

	//�طü�¼��
	ls_sql="select NVL(max(substr(hfjlh,8,3)),0)";
	ls_sql+=" from  crm_tshfjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	hfjlh=khbh+cf.addZero(count+1,3);

%>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center"> �ͻ�Ͷ�߱��޻طã��طü�¼�ţ�<%=hfjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">
          
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#E8E8FF"> 
            <td width="25%" align="left"> <font color="#0000CC">�ͻ���ţ�</font><%=khbh%> 
            </td>
            <td width="25%"><font color="#0000CC">��ͬ�ţ�</font><%=hth%> </td>
            <td width="25%"> <font color="#0000CC">�ͻ�������</font><%=khxm%></td>
            <td width="25%"><font color="#0000CC">�ʼ�Ա��</font><%=zjxm%> </td>
          </tr>
          <tr bgcolor="#E8E8FF"> 
            <td colspan="2" align="left"><font color="#0000CC">�ֻ���</font><%=lxfs%></td>
            <td colspan="2"><font color="#0000CC">�����绰��</font><%=qtdh%></td>
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
	cf.selectToken(out,"0+δ����&1+���̻طö���&2+Ͷ�߱��޻طö���&3+ȫ������",hfdjbz,true);
%> </td>
            <td width="25%"><font color="#0000CC">�����ˣ�</font><%=djr%> </td>
            <td width="25%"> <font color="#0000CC">����ʱ�䣺</font><%=djsj%></td>
            <td width="25%"><font color="#0000CC">�ƻ��ⶳʱ�䣺</font><%=jhjdsj%> </td>
          </tr>
          <tr bgcolor="#CCFFCC"> 
            <td colspan="4" align="left"><font color="#0000CC">����ԭ��</font><%=djyy%> 
            </td>
          </tr>
        </table>


<%
	if (gcjdbm.equals("4") || gcjdbm.equals("5"))
	{
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
		<%
	}


%>



<%
if (count>0)
{
%>
	<br>
	<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	  <tr bgcolor="#CCCCCC" align="center"> 
		<td width="8%"> 
		  <div align="center"><font color="#006666">�ط�ʱ��</font></div>
		</td>
		<td width="6%"> 
		  <div align="center"><font color="#006666">�ط���</font></div>
		</td>
		<td width="55%"> 
		  <div align="center"><font color="#006666">�ͻ��ط����</font></div>
		</td>
		<td width="41%"> 
		  <div align="center"><font color="#006666">�ط��г��ֵ�������</font></div>
		</td>
	  </tr>
	<%
	String khhfqk=null;
	String cxxwt=null;
	String hfsj=null;
	String hfr=null;

	ls_sql="select hfsj,hfr,khhfqk,cxxwt";
	ls_sql+=" from  crm_tshfjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by hfsj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khhfqk=cf.fillNull(rs.getString("khhfqk"));
		cxxwt=cf.fillNull(rs.getString("cxxwt"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		hfr=cf.fillNull(rs.getString("hfr"));

		%> 
		<tr bgcolor="#FFFFFF"> 
		  <td align="center" ><%=hfsj%></td>
		  <td align="center" ><%=hfr%></td>
		  <td ><%=khhfqk%></td>
		  <td ><%=cxxwt%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
	%>
	</table>
	<%
}
%> 


<form method="post" action="SaveInsertCrm_tshfjl.jsp" name="insertform" target="_blank">
          <%
	String tsjlh=null;
	String slfsbm=null;
	String yqjjsj=null;
	String ldyqjjsj=null;
	String tsbxsj=null;
	String slsj=null;
	String slr=null;
	String tslrsj=null;
	String tslrr=null;
	String tsnr=null;
	String lxmc=null;

	String bgcolor=null;
	String bgcolor1=null;

	int row=0;
	ls_sql="select tsjlh,slfsmc,tsbxsj,slsj,slr,lrsj,lrr,yqjjsj,ldyqjjsj,tsnr,lx,DECODE(lx,'1','Ͷ��','2','����') lxmc";
	ls_sql+=" from  crm_tsjl,dm_slfsbm";
	ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsjl.khbh='"+khbh+"'";
	ls_sql+="  and crm_tsjl.clzt not in('3','9')";
	ls_sql+=lxsql;
	ls_sql+="  order by tsjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		tsjlh=cf.fillHtml(rs.getString("tsjlh"));
		slfsbm=cf.fillHtml(rs.getString("slfsmc"));
		yqjjsj=cf.fillHtml(rs.getDate("yqjjsj"));
		ldyqjjsj=cf.fillHtml(rs.getDate("ldyqjjsj"));
		tsbxsj=cf.fillHtml(rs.getDate("tsbxsj"));
		slsj=cf.fillHtml(rs.getDate("slsj"));
		slr=cf.fillHtml(rs.getString("slr"));
		tslrsj=cf.fillHtml(rs.getDate("lrsj"));
		tslrr=cf.fillHtml(rs.getString("lrr"));
		tsnr=cf.fillHtml(rs.getString("tsnr"));
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));


		row++;

		if (row%2==1)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#CCFFCC";
		}
%> <b><font color="#0000CC" style='FONT-SIZE: 14px'>��[<%=row%>]��<%=slfsbm%><%=lxmc%>�J<A HREF="/tsgl/cx/ViewCrm_tsjl.jsp?tsjlh=<%=tsjlh%>" target="_blank">��¼�ţ�<%=tsjlh%></A></font></b> 
          <table border="1" width="100%" cellspacing="0" cellpadding="1" bgcolor="#FFFFFF"  style='FONT-SIZE: 12px'>
            <tr align="center" bgcolor="#E8E8FF"> 
              <td width="32%"><b>�ͻ�Ͷ�߱������</b></td>
              <td width="68%"><b>���β��Ŵ����ͷ��ط����</b></td>
            </tr>
            <tr> 
              <td align="left" width="32%" valign="top" ><b>����</b>��<%=slr%>,<%=slsj%> 
                <HR>
                <b>�ͻ�Ҫ����ʱ��</b>��<%=yqjjsj%> 
                <br>
				<b>�쵼Ҫ����ʱ��</b>��<%=ldyqjjsj%> 
                <HR>
                <b>�������</b>�� <BR>
                &nbsp;&nbsp;&nbsp;&nbsp;<U><font style="FONT-SIZE: 14px"><%=tsnr%></font></U> 
                <input type="hidden" name="tsjlh" value="<%=tsjlh%>" >

              </td>
              <td  align="right" rowspan="2" valign="top" width="68%"> <%
		String tsxlmc=null;
		String tsyybm=null;
		String tsyymc=null;
//		String dwmc=null;
		String clzt=null;
		String sfytz=null;
		String tzsj=null;
		String jssj=null;
		String jhcfasj=null;
		String sjcfasj=null;
		String jhjjsj=null;

		int row1=0;

		String nonestr="";
		String blockstr="";




		ls_sql="select tsxlmc,crm_tsbm.tsyybm,tsyymc,dwmc,DECODE(sfytz,'0','(δ֪ͨ)','1','(��֪ͨ)','3','(����֪ͨ)') sfytz ";
		ls_sql+=" ,DECODE(crm_tsbm.clzt,'1','δ����','2','�ѽ��յȴ�������','D','�ѽ��ղ��������','E','����ʵ','4','�ѽ��յȴ����ֳ�','6','�ѳ��ֳ��ȴ�������','7','�ѳ������ȴ����','8','�ѳ������������','9','�������ͨ��','A','�������δͨ��','3','�ѽ��','C','�ط�δ���','B','�ڴ���','5','�᰸') clzt";
		ls_sql+=" ,tzsj,jssj,jhcfasj,sjcfasj,jhjjsj";

		ls_sql+=" from  crm_tsbm,dm_tsxlbm,dm_tsyybm,sq_dwxx";
		ls_sql+=" where crm_tsbm.tsjlh='"+tsjlh+"'";
		ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+)  ";
		ls_sql+=" and crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+)  ";
		ls_sql+=" and crm_tsbm.dwbh=sq_dwxx.dwbh(+)";
		ls_sql+=" order by crm_tsbm.tsyybm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			tsxlmc=cf.fillHtml(rs1.getString("tsxlmc"));
			tsyybm=cf.fillHtml(rs1.getString("tsyybm"));
			tsyymc=cf.fillHtml(rs1.getString("tsyymc"));
			dwmc=cf.fillHtml(rs1.getString("dwmc"));
			sfytz=cf.fillHtml(rs1.getString("sfytz"));
			clzt=cf.fillHtml(rs1.getString("clzt"));
			dwmc=cf.fillHtml(rs1.getString("dwmc"));
			tzsj=cf.fillHtml(rs1.getDate("tzsj"));
			jssj=cf.fillHtml(rs1.getDate("jssj"));
			jhcfasj=cf.fillHtml(rs1.getDate("jhcfasj"));
			sjcfasj=cf.fillHtml(rs1.getDate("sjcfasj"));
			jhjjsj=cf.fillHtml(rs1.getDate("jhjjsj"));

			nonestr+="id"+tsjlh+tsyybm+".style.display ='none';";
			blockstr+="id"+tsjlh+tsyybm+".style.display ='block';";

			row1++;

			if (row1%2==1)
			{
				bgcolor1="#FFFFFF";
			}
			else{
				bgcolor1="#E8E8FF";
			}
			%> 
                <table border="1" width="100%"  height="150" cellspacing="0" cellpadding="1" bgcolor="<%=bgcolor1%>" style='FONT-SIZE: 12px'>
                  <tr> 
                    <td width="53%" align="left" valign="top"> 
						
						<b>���β��ţ�</b><%=dwmc%><font color="#CC0066">�J<%=clzt%><%=sfytz%></font><BR>
						<HR>
						<b>ԭ�����</b>��<%=tsxlmc%>�J<%=tsyymc%> 
						<HR>
						<b>����ʱ��</b>��<%=jssj%>   &nbsp;&nbsp;&nbsp;&nbsp;<b>�ƻ�������ʱ��</b>��<%=jhcfasj%> 
						<BR>
						<b>�ƻ����</b>��<%=jhjjsj%>  &nbsp;&nbsp;&nbsp;&nbsp;<b>ʵ�ʳ�����ʱ��</b>��<%=sjcfasj%>    
						<HR>

						<b>�������</b>�� 
						<%
						String cl_clsj=null;
						String cl_clr=null;
						String cl_clqk=null;
						String cl_clzt=null;
						int clxh=0;
						ls_sql =" select clr,clsj,clqk,DECODE(crm_tsbxcljl.clzt,'2','δ���','3','�ѽ��') clzt";
						ls_sql+=" from  crm_tsbxcljl";
						ls_sql+=" where tsjlh='"+tsjlh+"'";
						ls_sql+=" and tsyybm='"+tsyybm+"'";
						ls_sql+=" order by cljlh";
						ps2= conn.prepareStatement(ls_sql);
						rs2 =ps2.executeQuery();
						while (rs2.next())
						{
							cl_clsj=cf.fillHtml(rs2.getDate("clsj"));
							cl_clr=cf.fillHtml(rs2.getString("clr"));
							cl_clqk=cf.fillHtml(rs2.getString("clqk"));
							cl_clzt=cf.fillHtml(rs2.getString("clzt"));

							clxh++;

							%> 
							<BR>
							<BR>
							<U>��<%=clxh%>�Σ�<%=cl_clzt%>����<%=cl_clr%>��<%=cl_clsj%></U> 
							<BR>
							&nbsp;&nbsp;&nbsp;&nbsp;<U><font style="FONT-SIZE: 14px"><%=cl_clqk%></font></U> 
							<%
						}
						rs2.close();
						ps2.close();
						
						%> 

					</td>
                    <td colspan="4" width="47%" valign="top" align="center">
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" style='FONT-SIZE: 12px'>
                        <tr>
                          <td align="center">
						
						<B>�ͷ��ط�ʱ��д</B><IMG SRC="/images/168.gif"> 
						<HR>
						<b><font color="#FF0000">*</font>����Ŀǰ�������</b>�� 
						<select name="hfjgbm<%=tsjlh%><%=tsyybm%>" style="FONT-SIZE:12PX;WIDTH:132PX">
							<option value=""></option>
							<%
								cf.selectItem(out,"select hfjgbm,hfjgmc from dm_tshfjgbm order by hfjgbm","");
							%> 
						</select>

						<%
						if (lx.equals("2"))//1��Ͷ�ߣ�2������
						{
							%> 
							<BR>
							<b><font color="#FF0000">*</font>�Ƿ�ʱ��ϵ�ͻ�</b>�� 
							<select name="sfjslx<%=tsjlh%><%=tsyybm%>" style="FONT-SIZE:12PX;WIDTH:132PX">
								<option value=""></option>
								<%
									cf.selectToken(out,"Y+��ʱ��ϵ&N+δ��ʱ��ϵ&W+���δ֪","");
								%> 
							</select>
							<%
						}
						%> 
						  </td>
                        </tr>
                      </table>
							
                      <table width="100%"  bgcolor="#FFFFCC" border="0" cellpadding="0" cellspacing="0"  id="id<%=tsjlh%><%=tsyybm%>" style="display:none" style='FONT-SIZE: 12px'>
                        <tr>
                          <td align="center">
						<BR><B>���᰸��ѡ��</B>�K�K�K<BR>

						<b><font color="#FF0000">*</font>�᰸�ͻ��Ƿ�����</b>�� 
						<select name="zzjgbm<%=tsjlh%><%=tsyybm%>" style="FONT-SIZE:12PX;WIDTH:132PX">
							<option value=""></option>
							<%
								cf.selectItem(out,"select zzjgbm,zzjgmc from dm_zzjgbm order by zzjgbm","");
							%> 
						</select>

						<BR>
						<b><font color="#FF0000">*</font>��������Ƿ�ʱ</b>�� 
						<select name="jsxbm<%=tsjlh%><%=tsyybm%>" style="FONT-SIZE:12PX;WIDTH:132PX">
							<option value=""></option>
							<%
								cf.selectItem(out,"select jsxbm,jsxmc from dm_jsxbm order by jsxbm","");
							%> 
						</select>

						  </td>
                        </tr>
                      </table>

                    </td>
                  </tr>
                </table>
                <%
		}
		rs1.close();
		ps1.close();
		%> </td>
            </tr>
            <tr> 
              <td align="left" width="32%" valign="top" > <b><font color="#FF0000">*</font>�Ƿ�᰸</b>�� 
                <input type="radio" name="sfjxhf<%=tsjlh%>" value="Y" onclick="jasj<%=tsjlh%>.value='';<%=nonestr%>" >
                ���᰸ 
                <input type="radio" name="sfjxhf<%=tsjlh%>" value="N" onclick="jasj<%=tsjlh%>.value='<%=cf.today()%>';<%=blockstr%>">
                �᰸ 
				<IMG SRC="/images/169.gif" >
				<BR>
                <b><font color="#FF0000">*</font>�᰸ʱ��</b>�� 
                <input type="text" name="jasj<%=tsjlh%>" value="" size="12" maxlength="10"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onDblClick="JSCalendar(this)">


              </td>
            </tr>
          </table>
		<BR>
          <%
	}
	rs.close();
	ps.close();

	if (row==0)
	{
		return;
	}
%> 
		<b>�ͷ��ط�ʱ��д</b><img src="/images/168.gif" > 
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#FF0000">*</font>�ͻ��ط����</div>
              </td>
              <td colspan="3"> 
                <textarea name="khhfqk" cols="81" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">�ط��г��ֵ�������</div>
              </td>
              <td colspan="3"> 
                <textarea name="cxxwt" cols="81" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" bgcolor="#E8E8FF"> 
                <div align="right"><font color="#FF0000">*</font>����ʽ</div>
              </td>
              <td width="34%" bgcolor="#E8E8FF"> 
                <select name="clfs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f2(insertform)">
                  <option value=""></option>
                  <option value="0">���账��</option>
                  <option value="1">������ز���</option>
                </select>
              </td>
              <td rowspan="6" bgcolor="#E8E8FF" width="16%"> 
                <div align="right">��������</div>
              </td>
              <td rowspan="6" bgcolor="#E8E8FF" width="34%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" size="11" multiple>
                  <option value=""></option>
<%
	String sql="select sq_tsclbm.dwbh,a.dwmc||'��'||b.dwmc||'��' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+ssfgs+"' order by sq_tsclbm.dwbh";
	cf.selectItem(out,sql,"");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="16%" align="right">���˹�֪ͨ��������</td>
              <td width="34%">
                <input type="radio" name="hffkbmclzt" value="0">
                ��Ҫ 
                <input type="radio" name="hffkbmclzt" value="1">
                ����Ҫ
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="16%" align="right">�´λط�ʱ��</td>
              <td width="34%">
                <input type="text" name="xchfrq" value="" size="20" maxlength="10"ondblclick="JSCalendar(this)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0000">*</font>�ط���</td>
              <td width="34%"> 
                <input type="text" name="hfr" value="<%=yhmc%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0000">*</font>�ط�ʱ��</td>
              <td width="34%"> 
                <input type="text" name="hfsj" value="<%=cf.today()%>" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                <div align="right"><font color="#FF0000">*</font>�طò���</div>
              </td>
              <td width="34%"> 
                <select name="hfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+hfbm+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
                <input type="hidden" name="hfjlh" value="<%=hfjlh%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
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


<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f2(FormName)//����FormName:Form������
{
	if (FormName.clfs.value=='0')
	{
		notAll(FormName.dwbh);
	}
}

function f_do(FormName)//����FormName:Form������
{
	f2(FormName);

	if(	javaTrim(FormName.khhfqk)=="") {
		alert("��ѡ��[�ͻ��ط����]��");
		FormName.khhfqk.focus();
		return false;
	}

	if(	javaTrim(FormName.clfs)=="") {
		alert("��ѡ��[����ʽ]��");
		FormName.clfs.focus();
		return false;
	}
	if (FormName.clfs.value=='1')
	{
		if (!selectChecked(FormName.dwbh)){
			alert("��ѡ��[��������]��");
			FormName.dwbh.focus();
			return false;
		}

		if(	!radioChecked(FormName.hffkbmclzt)) {
			alert("��ѡ��[���˹�֪ͨ��������]��");
			FormName.hffkbmclzt[0].focus();
			return false;
		}
	}

	if(!(isDatetime(FormName.xchfrq, "�´λط�����"))) {
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
