<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String jc_mmydd_yddbh=null;
String khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_kgrq=null;
String crm_khxx_jgrq=null;
String crm_khxx_sgd=null;
String crm_khxx_zjxm=null;
String crm_khxx_qyrq=null;
String crm_khxx_dwbh=null;
String jc_mmydd_wjqk=null;
String jc_mmydd_sqdj=null;
String jc_mmydd_clgw=null;
String jc_mmydd_pdgc=null;
String jc_mmydd_mmcljs=null;
String jc_mmydd_jhccsj=null;
String jc_mmydd_sccsj=null;
String jc_mmydd_ccsm=null;
String jc_mmydd_mmhtje=null;
String jc_mmydd_wjhtje=null;
String jc_mmydd_blhtje=null;
String jc_mmydd_htje=null;
String jc_mmydd_htrq=null;
String jc_mmydd_htqdr=null;
String jc_mmydd_htbz=null;
String jc_mmydd_wjsgsbz=null;
String jc_mmydd_swjsj=null;
String jc_mmydd_wjjsr=null;
String jc_mmydd_wjjsqk=null;
String jc_mmydd_srksj=null;
String jc_mmydd_rkr=null;
String jc_mmydd_rksm=null;
String jc_mmydd_jhazsj=null;
String jc_mmydd_sshsj=null;
String jc_mmydd_azkssj=null;
String jc_mmydd_azjssj=null;
String jc_mmydd_mmycyybm=null;
String jc_mmydd_ycsm=null;
String jc_mmydd_zsycyybm=null;
String jc_mmydd_ychsqk=null;
String jc_mmydd_ychsr=null;
String jc_mmydd_ychssj=null;
String jc_mmydd_sfjs=null;
String jc_mmydd_clzt=null;
String jc_mmydd_lrr=null;
String jc_mmydd_lrsj=null;
String sq_dwxx_dwmc=null;
String jc_mmydd_bz=null;

String jc_mmydd_xmzy=null;
String jc_mmydd_ztjjgw=null;
double mmzkl=0;
String dzyy=null;


String sgbz=null;
String bzdh="";
String zjdh="";
String sjsdh="";
String dzdh=null;
String lxfs=null;

String paidr=null;
String paidsj=null;
String ycclzt=null;

String cxhdbm=null;
String fkje=null;
String jhazsj=null;
String kjxsj=null;
String fwf=null;
String wdzje=null;
String zjhmmje=null;
String zjhwjje=null;
String zjhblje=null;
String zjhze=null;

String sjs=null;
String fgsbh=null;
String khjl=null;

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String zjxxh=null;
String jjwjbz="";
int count=0;

try {
	conn=cf.getConnection();


	ls_sql="select count(*) ";
	ls_sql+=" from  jc_mmzjx";
	ls_sql+=" where yddbh='"+yddbh+"' and clzt='00' ";
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
		out.println("������������δ��ɣ����ܼ���¼���µ�");
		return;
	}


	ls_sql="select crm_khxx.jjwjbz,jc_mmydd.mmzkl,jc_mmydd.dzyy,crm_khxx.fgsbh,crm_khxx.sjs,crm_khxx.khjl,jc_mmydd.fwf,jc_mmydd.wdzje,jc_mmydd.zjhmmje,jc_mmydd.zjhwjje,jc_mmydd.zjhblje,jhazsj,kjxsj,zjhze,cxhdbm,sgbz,paidr,paidsj,ycclzt,crm_khxx.lxfs,jc_mmydd.yddbh as jc_mmydd_yddbh,jc_mmydd.khbh as khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.kgrq as crm_khxx_kgrq,crm_khxx.jgrq as crm_khxx_jgrq,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.dwbh as crm_khxx_dwbh,jc_mmydd.wjqk as jc_mmydd_wjqk,jc_mmydd.sqdj as jc_mmydd_sqdj,jc_mmydd.clgw as jc_mmydd_clgw,jc_mmydd.ztjjgw as jc_mmydd_ztjjgw,jc_mmydd.xmzy as jc_mmydd_xmzy,jc_mmydd.pdgc as jc_mmydd_pdgc,jc_mmydd.mmcljs as jc_mmydd_mmcljs,jc_mmydd.jhccsj as jc_mmydd_jhccsj,jc_mmydd.sccsj as jc_mmydd_sccsj,jc_mmydd.ccsm as jc_mmydd_ccsm,jc_mmydd.mmhtje as jc_mmydd_mmhtje,jc_mmydd.wjhtje as jc_mmydd_wjhtje,jc_mmydd.blhtje as jc_mmydd_blhtje,jc_mmydd.htje as jc_mmydd_htje,jc_mmydd.htrq as jc_mmydd_htrq,jc_mmydd.htqdr as jc_mmydd_htqdr,jc_mmydd.htbz as jc_mmydd_htbz,jc_mmydd.wjsgsbz as jc_mmydd_wjsgsbz,jc_mmydd.swjsj as jc_mmydd_swjsj,jc_mmydd.wjjsr as jc_mmydd_wjjsr,jc_mmydd.wjjsqk as jc_mmydd_wjjsqk,jc_mmydd.srksj as jc_mmydd_srksj,jc_mmydd.rkr as jc_mmydd_rkr,jc_mmydd.rksm as jc_mmydd_rksm,jc_mmydd.jhazsj as jc_mmydd_jhazsj,jc_mmydd.sshsj as jc_mmydd_sshsj,jc_mmydd.azkssj as jc_mmydd_azkssj,jc_mmydd.azjssj as jc_mmydd_azjssj,jc_mmydd.mmycyybm as jc_mmydd_mmycyybm,jc_mmydd.ycsm as jc_mmydd_ycsm,jc_mmydd.zsycyybm as jc_mmydd_zsycyybm,jc_mmydd.ychsqk as jc_mmydd_ychsqk,jc_mmydd.ychsr as jc_mmydd_ychsr,jc_mmydd.ychssj as jc_mmydd_ychssj,jc_mmydd.sfjs as jc_mmydd_sfjs,jc_mmydd.clzt as jc_mmydd_clzt,jc_mmydd.lrr as jc_mmydd_lrr,jc_mmydd.lrsj as jc_mmydd_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,jc_mmydd.bz as jc_mmydd_bz ";
	ls_sql+=" from  crm_khxx,jc_mmydd,sq_dwxx";
	ls_sql+=" where jc_mmydd.dwbh=sq_dwxx.dwbh and jc_mmydd.khbh=crm_khxx.khbh(+) and  (jc_mmydd.yddbh='"+yddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
		mmzkl=rs.getDouble("mmzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		khjl=cf.fillNull(rs.getString("khjl"));
		fwf=cf.fillNull(rs.getString("fwf"));
		wdzje=cf.fillNull(rs.getString("wdzje"));
		zjhmmje=cf.fillNull(rs.getString("zjhmmje"));
		zjhwjje=cf.fillNull(rs.getString("zjhwjje"));
		zjhblje=cf.fillNull(rs.getString("zjhblje"));
		jhazsj=cf.fillNull(rs.getDate("jhazsj"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		zjhze=cf.fillNull(rs.getString("zjhze"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		paidr=cf.fillNull(rs.getString("paidr"));
		paidsj=cf.fillNull(rs.getDate("paidsj"));
		ycclzt=cf.fillNull(rs.getString("ycclzt"));
		lxfs=cf.fillNull(rs.getString("lxfs"));

		jc_mmydd_yddbh=cf.fillNull(rs.getString("jc_mmydd_yddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_kgrq=cf.fillNull(rs.getDate("crm_khxx_kgrq"));
		crm_khxx_jgrq=cf.fillNull(rs.getDate("crm_khxx_jgrq"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		crm_khxx_qyrq=cf.fillNull(rs.getDate("crm_khxx_qyrq"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		jc_mmydd_wjqk=cf.fillNull(rs.getString("jc_mmydd_wjqk"));
		jc_mmydd_sqdj=cf.fillNull(rs.getString("jc_mmydd_sqdj"));
		jc_mmydd_clgw=cf.fillNull(rs.getString("jc_mmydd_clgw"));
		jc_mmydd_xmzy=cf.fillNull(rs.getString("jc_mmydd_xmzy"));
		jc_mmydd_ztjjgw=cf.fillNull(rs.getString("jc_mmydd_ztjjgw"));
		jc_mmydd_pdgc=cf.fillNull(rs.getString("jc_mmydd_pdgc"));
		jc_mmydd_mmcljs=cf.fillNull(rs.getString("jc_mmydd_mmcljs"));
		jc_mmydd_jhccsj=cf.fillNull(rs.getDate("jc_mmydd_jhccsj"));
		jc_mmydd_sccsj=cf.fillNull(rs.getDate("jc_mmydd_sccsj"));
		jc_mmydd_ccsm=cf.fillNull(rs.getString("jc_mmydd_ccsm"));
		jc_mmydd_mmhtje=cf.fillNull(rs.getString("jc_mmydd_mmhtje"));
		jc_mmydd_wjhtje=cf.fillNull(rs.getString("jc_mmydd_wjhtje"));
		jc_mmydd_blhtje=cf.fillNull(rs.getString("jc_mmydd_blhtje"));
		jc_mmydd_htje=cf.fillNull(rs.getString("jc_mmydd_htje"));
		jc_mmydd_htrq=cf.fillNull(rs.getDate("jc_mmydd_htrq"));
		jc_mmydd_htqdr=cf.fillNull(rs.getString("jc_mmydd_htqdr"));
		jc_mmydd_htbz=cf.fillNull(rs.getString("jc_mmydd_htbz"));
		jc_mmydd_wjsgsbz=cf.fillNull(rs.getString("jc_mmydd_wjsgsbz"));
		jc_mmydd_swjsj=cf.fillNull(rs.getDate("jc_mmydd_swjsj"));
		jc_mmydd_wjjsr=cf.fillNull(rs.getString("jc_mmydd_wjjsr"));
		jc_mmydd_wjjsqk=cf.fillNull(rs.getString("jc_mmydd_wjjsqk"));
		jc_mmydd_srksj=cf.fillNull(rs.getDate("jc_mmydd_srksj"));
		jc_mmydd_rkr=cf.fillNull(rs.getString("jc_mmydd_rkr"));
		jc_mmydd_rksm=cf.fillNull(rs.getString("jc_mmydd_rksm"));
		jc_mmydd_jhazsj=cf.fillNull(rs.getDate("jc_mmydd_jhazsj"));
		jc_mmydd_sshsj=cf.fillNull(rs.getDate("jc_mmydd_sshsj"));
		jc_mmydd_azkssj=cf.fillNull(rs.getDate("jc_mmydd_azkssj"));
		jc_mmydd_azjssj=cf.fillNull(rs.getDate("jc_mmydd_azjssj"));
		jc_mmydd_mmycyybm=cf.fillNull(rs.getString("jc_mmydd_mmycyybm"));
		jc_mmydd_ycsm=cf.fillNull(rs.getString("jc_mmydd_ycsm"));
		jc_mmydd_zsycyybm=cf.fillNull(rs.getString("jc_mmydd_zsycyybm"));
		jc_mmydd_ychsqk=cf.fillNull(rs.getString("jc_mmydd_ychsqk"));
		jc_mmydd_ychsr=cf.fillNull(rs.getString("jc_mmydd_ychsr"));
		jc_mmydd_ychssj=cf.fillNull(rs.getDate("jc_mmydd_ychssj"));
		jc_mmydd_sfjs=cf.fillNull(rs.getString("jc_mmydd_sfjs"));
		jc_mmydd_clzt=cf.fillNull(rs.getString("jc_mmydd_clzt"));
		jc_mmydd_lrr=cf.fillNull(rs.getString("jc_mmydd_lrr"));
		jc_mmydd_lrsj=cf.fillNull(rs.getDate("jc_mmydd_lrsj"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		jc_mmydd_bz=cf.fillNull(rs.getString("jc_mmydd_bz"));
	}
	rs.close();
	ps.close();

	if (jjwjbz.equals("Y"))
	{
		out.println("���󣡿ͻ��Ҿ�����ᣬ������¼�붩��");
		return;
	}

	ls_sql=" select dh from sq_sgd";
	ls_sql+=" where sgd='"+crm_khxx_sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+crm_khxx_dwbh+"' and yhmc ='"+crm_khxx_sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+crm_khxx_sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where sq_yhxx.ssfgs='"+fgsbh+"' and yhmc ='"+crm_khxx_zjxm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql="select NVL(max(substr(zjxxh,10,2)),0)";
	ls_sql+=" from  jc_mmzjx";
	ls_sql+=" where yddbh='"+yddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	zjxxh=yddbh+cf.addZero(count+1,2);

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
<%
if (count>0)
{
	%>
	
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">���</td>
	<td  width="7%">�ɵ�����</td>
	<td  width="10%">����״̬</td>
	<td  width="8%">�ͻ�����</td>
	<td  width="12%">������ԭ��</td>
	<td  width="9%">�������ܶ�</td>
	<td  width="9%">����ʱ��</td>
	<td  width="9%">¼��ʱ��</td>
	<td  width="12%">¼�벿��</td>
	<td  width="18%">��ע</td>
	</tr>
		<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();

		ls_sql="SELECT jc_mmzjx.zjxxh, jc_mmydd.pdgc,DECODE(jc_mmzjx.clzt,'00','¼��δ���','01','¼�����','02','�����ѽ���','03','�����','04','��װ���','99','�˵�'),crm_khxx.khxm,mmzjxyymc,jc_mmzjx.zjxze,jc_mmzjx.zjxfssj,jc_mmzjx.lrsj,c.dwmc lrbm,jc_mmzjx.bz";
		ls_sql+=" FROM crm_khxx,jc_mmzjx,sq_dwxx c,jdm_mmzjxyybm,jc_mmydd  ";
		ls_sql+=" where jc_mmzjx.khbh=crm_khxx.khbh(+) and jc_mmzjx.mmzjxyybm=jdm_mmzjxyybm.mmzjxyybm(+)";
		ls_sql+=" and jc_mmzjx.dwbh=c.dwbh(+)";
		ls_sql+=" and jc_mmzjx.yddbh=jc_mmydd.yddbh ";
		ls_sql+=" and jc_mmzjx.yddbh='"+yddbh+"'";
		ls_sql+=" order by jc_mmzjx.zjxxh";

	//	out.println(ls_sql);
		pageObj.sql=ls_sql;
	//���ж����ʼ��
		pageObj.initPage("","","","");
		pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


	//�����г�������
		Hashtable coluParmHash=new Hashtable();
		ColuParm coluParm=null;

		coluParm=new ColuParm();//����һ���в�������
		String[] coluKey={"zjxxh"};//�����в�����coluParm.key������
		coluParm.key=coluKey;//�����в�����coluParm.key������
		coluParm.link="/jcjj/mmcl/mmzjx/ViewJc_mmzjx.jsp?yddbh="+yddbh;//Ϊ�в�����coluParm.link���ó�������
		coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
		coluParmHash.put("zjxxh",coluParm);//�в����������Hash��
		pageObj.setColuLink(coluParmHash);//�в����������Hash��

		
		pageObj.out=out;
		pageObj.getDate(1);
	pageObj.displayDateSum();

	%> 
	</table>
	<%
}
%>

<table width="100%">
  <tr>
    <td width="100%" height="2"> 
      <div align="center"> ��¼��ľ���������������ţ�<%=zjxxh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                �ͻ����              </td>
              <td width="32%"> <%=khbh%></td>
              <td width="18%" align="right"> 
                ��ͬ��              </td>
              <td width="32%"><%=crm_khxx_hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                �ͻ�����              </td>
              <td width="32%"> <%=crm_khxx_khxm%>��
                <input type="button" value="�鿴�绰" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" name="button4" >
�� </td>
              <td width="18%" align="right">���ݵ�ַ </td>
              <td width="32%"><%=crm_khxx_fwdz%> </td>
            </tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF">ǩԼ����</td>
              <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_khxx_dwbh+"'",crm_khxx_dwbh,true);
%></td>
              <td width="18%" align="right">��װ���ʦ</td>
              <td width="32%"><%=crm_khxx_sjs%>��<%=sjsdh%>��</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                ʩ����              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+crm_khxx_sgd+"'",crm_khxx_sgd,true);
%>��<%=dzdh%>�� </td>
              <td width="18%" align="right"> 
                �೤              </td>
              <td width="32%"><%=sgbz%>��<%=bzdh%>�� </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                ��װǩԼ����              </td>
              <td width="32%"> <%=crm_khxx_qyrq%> </td>
              <td width="18%" align="right"> 
                �ʼ�              </td>
              <td width="32%"><%=crm_khxx_zjxm%>��<%=zjdh%>�� </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                ��ͬ��������              </td>
              <td width="32%"> <%=crm_khxx_kgrq%> </td>
              <td width="18%" align="right"> 
                ��ͬ��������              </td>
              <td width="32%"> <%=crm_khxx_jgrq%> </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%" align="right" bgcolor="#CCFFCC">�μӴ����</td>
              <td colspan="3"> <%=cxhdbm%> </td>
            </tr>
            <tr bgcolor="#99CCFF"> 
              <td width="18%" align="right"> 
                ������              </td>
              <td width="32%"> <%
	cf.radioToken(out, "1+�ͻ��Թ�&2+��˾����",jc_mmydd_wjqk,true);
%> </td>
              <td width="18%" align="right"> 
                ľ�Ŷ���              </td>
              <td width="32%"> <%=jc_mmydd_sqdj%> </td>
            </tr>
            <tr bgcolor="#99CCFF"> 
              <td width="18%" align="right"> 
                ��ĿרԱ              </td>
              <td width="32%"><%=jc_mmydd_xmzy%> </td>
              <td width="18%" align="right"> 
                ����״̬              </td>
              <td width="32%"><%
	cf.selectItem(out,"select clzt,clztmc from jdm_mmyddzt where clzt='"+jc_mmydd_clzt+"'",jc_mmydd_clzt,true);
%> </td>
            </tr>
            <tr bgcolor="#99CCFF"> 
              <td width="18%" align="right" bgcolor="#99CCFF"> 
                פ��Ҿӹ���              </td>
              <td width="32%"> <%=jc_mmydd_clgw%></td>
              <td width="18%" align="right"> 
                չ���Ҿӹ���              </td>
              <td width="32%"><%=jc_mmydd_ztjjgw%> </td>
            </tr>
            
            <tr bgcolor="#99CCFF"> 
              <td width="18%" bgcolor="#99CCFF" align="right">��ע</td>
              <td colspan="3"><%=jc_mmydd_bz%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">ľ�ź�ͬ���</td>
              <td width="32%"> <%=jc_mmydd_mmhtje%> </td>
              <td width="18%" align="right">������ľ�Ž��</td>
              <td width="32%"><%=zjhmmje%></td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">����ͬ���</td>
              <td><%=jc_mmydd_wjhtje%></td>
              <td align="right">�����������</td>
              <td><%=zjhwjje%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">������ͬ���</td>
              <td width="32%"> <%=jc_mmydd_blhtje%> </td>
              <td width="18%" align="right">�����������</td>
              <td width="32%"><%=zjhblje%></td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td bgcolor="#CCCCFF" align="right">�����</td>
              <td><%=fwf%></td>
              <td align="right">δ���۽��</td>
              <td><%=wdzje%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" bgcolor="#CCCCFF" align="right">��ͬ���</td>
              <td width="32%"><%=jc_mmydd_htje%></td>
              <td width="18%" align="right">�������ܶ�</td>
              <td width="32%"><%=zjhze%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF">ǩ��ͬ����</td>
              <td width="32%"> <%=jc_mmydd_htrq%> </td>
              <td width="18%" align="right">��ͬǩ����</td>
              <td width="32%"> <%=jc_mmydd_htqdr%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF">��ͬ��ע</td>
              <td colspan="3"><%=jc_mmydd_htbz%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%" align="right">��ͬ��װʱ��</td>
              <td width="32%"><%=jhazsj%></td>
              <td width="18%" bgcolor="#CCFFCC" align="right">�ɼ����ֹʱ��</td>
              <td width="32%"><%=kjxsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�����ۿ�</td>
              <td colspan="3"><input type="text" name="mmzkl" size="8" maxlength="8" value="<%=mmzkl%>" readonly>
                  <b><font color="#0000FF">��>0��<=10��</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">����ԭ��</td>
              <td colspan="3"><textarea name="dzyy" cols="71" rows="3" readonly><%=dzyy%></textarea></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0033">*</font>������ԭ��</td>
              <td width="32%">
                <select name="mmzjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmzjxyybm,mmzjxyymc from jdm_mmzjxyybm order by mmzjxyybm","");
%> 
              </select>              </td>
              <td width="18%" align="right"><font color="#FF0033">*</font>�ƻ���װʱ��</td>
              <td width="32%">
              <input type="text" name="jhazsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0033">*</font>�������ʱ��</td>
              <td width="32%">
              <input type="text" name="zjxfssj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right"><font color="#FF0033">*</font><font color="#0000FF">¼��ʱ��</font></td>
              <td width="32%">
              <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0033">*</font><font color="#0000FF">¼����</font></td>
              <td width="32%">
              <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="18%" align="right"><font color="#FF0033">*</font><font color="#0000FF">¼�벿��</font></td>
              <td width="32%">
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" height="2">��ע</td>
              <td colspan="3" height="2"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
        </table>

          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="3" cellspacing="3">
			<tr align="center"> 
              <td> 
                  <input type="hidden" name="fgsbh" value="<%=fgsbh%>" >
                  <input type="hidden" name="qddm" value="<%=crm_khxx_dwbh%>" >
                  <input type="hidden" name="jzsjs" value="<%=sjs%>" >
                  <input type="hidden" name="khjl" value="<%=khjl%>" >
                  <input type="hidden" name="zjxxh" value="<%=zjxxh%>" readonly>
                  <input type="hidden" name="yddbh" value="<%=yddbh%>" >
                  <input type="hidden" name="khbh" value="<%=khbh%>" >
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset"  value="����" name="reset">
                  <input type="button"  value="���" onClick="f_end(insertform)" name="wc" disabled>
                  <input type="button"  value="��ӡ" onClick="window.open('/jcjj/dygl/dymmhtfjzjx.jsp?yddbh=<%=yddbh%>&zjxxh=<%=zjxxh%>')" name="dy" disabled>
			  </td>
            </tr>
			<tr align="center">
			  <td><input type="button"  value="��������ľ����Ŀ" onClick="f_zjmm(insertform)" name="zjmm" disabled>
                <input type="button"  value="������ľ����Ŀ" onClick="f_newmm(insertform)" name="newmm" disabled>
                <input type="button"  value="ȷ��ľ����������" onClick="f_mmsl(insertform)" name="mmsl" disabled></td>
		    </tr>
			<tr align="center">
			  <td><input type="button"  value="�������������Ŀ" onClick="f_zjwj(insertform)" name="zjwj" disabled>
                <input type="button"  value="�����������Ŀ" onClick="f_newwj(insertform)" name="newwj" disabled>
                <input type="button"  value="ȷ�������������" onClick="f_wjsl(insertform)" name="wjsl" disabled></td>
		    </tr>
			<tr align="center">
			  <td><input type="button"  value="�������в�����Ŀ" onClick="f_zjbl(insertform)" name="zjbl" disabled>
                <input type="button"  value="�����²�����Ŀ" onClick="f_newbl(insertform)" name="newbl" disabled>
                <input type="button"  value="ȷ��������������" onClick="f_blsl(insertform)" name="blsl" disabled></td>
		    </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "���������"))) {
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.mmzjxyybm)=="") {
		alert("��ѡ��[������ԭ��]��");
		FormName.mmzjxyybm.focus();
		return false;
	}

	if(	javaTrim(FormName.jhazsj)=="") {
		alert("������[�ƻ���װʱ��]��");
		FormName.jhazsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhazsj, "�ƻ���װʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.zjxfssj)=="") {
		alert("������[�������ʱ��]��");
		FormName.zjxfssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.zjxfssj, "�������ʱ��"))) {
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

	if (FormName.zjxfssj.value>FormName.lrsj.value)
	{
		alert("[�������ʱ��]���ܴ���[¼��ʱ��]��");
		FormName.zjxfssj.select();
		return false;
	}
	
	
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.dwbh.focus();
		return false;
	}

	if(	javaTrim(FormName.mmzkl)=="") {
		alert("������[�����ۿ�]��");
		FormName.mmzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.mmzkl, "�����ۿ�"))) {
		return false;
	}
	if (FormName.mmzkl.value<=0 || FormName.mmzkl.value>10)
	{
		alert("����[�����ۿ�]Ӧ����0��10֮�䣡");
		FormName.mmzkl.select();
		return false;
	}
	if (FormName.mmzkl.value!=10)
	{
		if(	javaTrim(FormName.dzyy)=="") {
			alert("������[����ԭ��]��");
			FormName.dzyy.focus();
			return false;
		}
	}

	FormName.action="SaveInsertJc_mmzjx.jsp";
	FormName.submit();
	FormName.wc.disabled=false;
	FormName.dy.disabled=false;
	FormName.zjmm.disabled=false;
	FormName.newmm.disabled=false;
	FormName.mmsl.disabled=false;
	FormName.zjwj.disabled=false;
	FormName.newwj.disabled=false;
	FormName.wjsl.disabled=false;
	FormName.zjbl.disabled=false;
	FormName.newbl.disabled=false;
	FormName.blsl.disabled=false;
	return true;
}
function f_end(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "���������"))) {
		return false;
	}
	FormName.action="EndJc_mmzjx.jsp";
	FormName.submit();
	return true;
}

function f_zjmm(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "���������"))) {
		return false;
	}
	
	FormName.action="Jc_mmdgdmxList.jsp";
	FormName.submit();
	return true;
}

function f_newmm(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "���������"))) {
		return false;
	}

	FormName.action="Jc_mmdgdmxMain.jsp";
	FormName.submit();
	return true;
}
function f_mmsl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "���������"))) {
		return false;
	}

	FormName.action="Jc_mmdgdmxZjxList.jsp";
	FormName.submit();
	return true;
}

function f_zjwj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "���������"))) {
		return false;
	}

	FormName.action="Jc_wjjddmxList.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_newwj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "���������"))) {
		return false;
	}

	FormName.action="InsertJc_wjjddmxMain.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_wjsl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "���������"))) {
		return false;
	}

	FormName.action="Jc_wjjddmxZjxList.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
function f_zjbl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "���������"))) {
		return false;
	}


	FormName.action="Jc_blddmxList.jsp";

	FormName.target="_blank";
	FormName.submit();
	return true;
}
function f_newbl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "���������"))) {
		return false;
	}

	FormName.action="InsertJc_blddmx.jsp";

	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_blsl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "���������"))) {
		return false;
	}

	FormName.action="Jc_blddmxZjxList.jsp";

	FormName.target="_blank";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
