<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cqbm=null;
	String xqmc=null;
	String xsfs=null;
	String hxzl=null;
	String kfs=null;
	String jzs=null;
	String xss=null;
	String yzxfsp=null;
	String fyssj=null;
	String lrsj=null;
	String ywy=null;

	String fgsbh=null;
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		fgsbh=cf.GB2Uni(fgsbh);
		if (!(fgsbh.equals("")))	wheresql+=" and  (yx_lsdcb.fgsbh='"+fgsbh+"')";
	}
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (yx_lsdcb.dqbm='"+dqbm+"')";
	}

	cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		cqbm=cf.GB2Uni(cqbm);
		if (!(cqbm.equals("")))	wheresql+=" and  (yx_lsdcb.cqbm='"+cqbm+"')";
	}
	xqmc=request.getParameter("xqmc");
	if (xqmc!=null)
	{
		xqmc=cf.GB2Uni(xqmc);
		if (!(xqmc.equals("")))	wheresql+=" and  (yx_lsdcb.xqmc='"+xqmc+"')";
	}

	xsfs=request.getParameter("xsfs");
	if (xsfs!=null)
	{
		xsfs=cf.GB2Uni(xsfs);
		if (!(xsfs.equals("")))	wheresql+=" and  (yx_lsdcb.xsfs='"+xsfs+"')";
	}
	hxzl=request.getParameter("hxzl");
	if (hxzl!=null)
	{
		hxzl=cf.GB2Uni(hxzl);
		if (!(hxzl.equals("")))	wheresql+=" and  (yx_lsdcb.hxzl='"+hxzl+"')";
	}
	kfs=request.getParameter("kfs");
	if (kfs!=null)
	{
		kfs=cf.GB2Uni(kfs);
		if (!(kfs.equals("")))	wheresql+=" and  (yx_lsdcb.kfs='"+kfs+"')";
	}
	jzs=request.getParameter("jzs");
	if (jzs!=null)
	{
		jzs=cf.GB2Uni(jzs);
		if (!(jzs.equals("")))	wheresql+=" and  (yx_lsdcb.jzs='"+jzs+"')";
	}
	xss=request.getParameter("xss");
	if (xss!=null)
	{
		xss=cf.GB2Uni(xss);
		if (!(xss.equals("")))	wheresql+=" and  (yx_lsdcb.xss='"+xss+"')";
	}
	yzxfsp=request.getParameter("yzxfsp");
	if (yzxfsp!=null)
	{
		yzxfsp=cf.GB2Uni(yzxfsp);
		if (!(yzxfsp.equals("")))	wheresql+=" and  (yx_lsdcb.yzxfsp='"+yzxfsp+"')";
	}
	fyssj=request.getParameter("fyssj");
	if (fyssj!=null)
	{
		fyssj=fyssj.trim();
		if (!(fyssj.equals("")))	wheresql+="  and (yx_lsdcb.fyssj>=TO_DATE('"+fyssj+"','YYYY/MM/DD'))";
	}
	fyssj=request.getParameter("fyssj2");
	if (fyssj!=null)
	{
		fyssj=fyssj.trim();
		if (!(fyssj.equals("")))	wheresql+="  and (yx_lsdcb.fyssj<=TO_DATE('"+fyssj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (yx_lsdcb.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (yx_lsdcb.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (yx_lsdcb.ywy='"+ywy+"')";
	}

    

	ls_sql="SELECT yx_lsdcb.dqbm,dqmc,xqmc,cqmc,jw,fyssj,kfslxr,kfs,kfslxrdh,lrr,lrsj,dwmc fgsbh  ";
	ls_sql+=" FROM yx_lsdcb,dm_cqbm,dm_dqbm,sq_dwxx";
    ls_sql+=" where yx_lsdcb.cqbm=dm_cqbm.cqbm and yx_lsdcb.dqbm=dm_dqbm.dqbm and yx_lsdcb.fgsbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by yx_lsdcb.dqbm,xqmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Yx_lsdcbList.jsp","SelectYx_lsdcb.jsp","","EditYx_lsdcb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"dqmc","xqmc","cqmc","jw","fyssj","kfs","kfslxr","kfslxrdh","lrr","lrsj","fgsbh"};
	pageObj.setDisColName(disColName);

//��������
	String[] keyName={"dqbm","xqmc"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Yx_lsdcbList.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"dqbm","xqmc"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewYx_lsdcb.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xqmc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem=cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from yx_lsdcb where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}

	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ά����¥����Ϣ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="4%">����</td>
	<td  width="12%">С������</td>
	<td  width="5%">����</td>
	<td  width="10%">��λ</td>
	<td  width="6%">��Կ��ʱ��</td>
	<td  width="15%">������</td>
	<td  width="10%">��ϵ��</td>
	<td  width="16%">��������ϵ�˵绰</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="7%">��˾</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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