<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='011502'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[ϵͳ��־]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>
<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String xh=null;
	String ip=null;
	String yhdlm=null;
	String yhmc=null;
	String dlsj=null;
	String tcsj=null;

	
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+dwbh+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (sq_ckxxrz.xh="+xh+") ";
	}
	ip=request.getParameter("ip");
	if (ip!=null)
	{
		ip=cf.GB2Uni(ip);
		if (!(ip.equals("")))	wheresql+=" and  (sq_ckxxrz.ip='"+ip+"')";
	}
	yhdlm=request.getParameter("yhdlm");
	if (yhdlm!=null)
	{
		yhdlm=cf.GB2Uni(yhdlm);
		if (!(yhdlm.equals("")))	wheresql+=" and  (sq_ckxxrz.yhdlm='"+yhdlm+"')";
	}
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc='"+yhmc+"')";
	}
	dlsj=request.getParameter("dlsj");
	if (dlsj!=null)
	{
		dlsj=dlsj.trim();
		if (!(dlsj.equals("")))	wheresql+="  and (sq_ckxxrz.dlsj>=TO_DATE('"+dlsj+"','YYYY/MM/DD'))";
	}
	dlsj=request.getParameter("dlsj2");
	if (dlsj!=null)
	{
		dlsj=dlsj.trim();
		if (!(dlsj.equals("")))	wheresql+="  and (sq_ckxxrz.dlsj<=TO_DATE('"+dlsj+"','YYYY/MM/DD'))";
	}
	tcsj=request.getParameter("tcsj");
	if (tcsj!=null)
	{
		tcsj=tcsj.trim();
		if (!(tcsj.equals("")))	wheresql+="  and (sq_ckxxrz.tcsj=TO_DATE('"+tcsj+"','YYYY/MM/DD'))";
	}
	String bz=null;
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and (sq_ckxxrz.bz like '%"+bz+"%') ";
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	ls_sql="SELECT a.dwmc,zwmc,sq_ckxxrz.yhdlm,sq_yhxx.yhmc ,count(*) cc";
	ls_sql+=" FROM sq_yhxx,sq_ckxxrz,sq_dwxx b,sq_dwxx a ,dm_zwbm ";
    ls_sql+=" where sq_ckxxrz.yhdlm=sq_yhxx.yhdlm(+) and sq_yhxx.dwbh=b.dwbh(+) and b.ssfgs=a.dwbh(+) and sq_yhxx.zwbm=dm_zwbm.zwbm(+)";
    ls_sql+=wheresql;
	ls_sql+=" group by sq_ckxxrz.yhdlm,sq_yhxx.yhmc,a.dwmc,zwmc";
	ls_sql+=" order by cc desc";
    
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("yhtj.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","ip","yhdlm","dlsj","tcsj"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
	pageObj.setDateType("long");
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"sq_ckxxrzCxList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);*/
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="14%">�����ֹ�˾</td>
	<td  width="14%">ְ��</td>
	<td  width="14%">�û���½��</td>
	<td  width="10%">�û�����</td>
	<td  width="14%">�û���½����</td>
	
	
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>